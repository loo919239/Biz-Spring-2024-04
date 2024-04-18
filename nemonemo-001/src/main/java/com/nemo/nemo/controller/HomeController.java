package com.nemo.nemo.controller;

import java.lang.reflect.Field;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nemo.nemo.dao.NemoDao;
import com.nemo.nemo.model.NemoVO;

@Controller
public class HomeController {
  
    private final NemoDao nemoDao;
    
    public HomeController(NemoDao nemoDao) {
        this.nemoDao = nemoDao;
    }
    
    @GetMapping("/")
    public String showNonogram(Model model) {
        List<NemoVO> vo = nemoDao.selectAll();
        
        for(NemoVO row : vo) {
            StringBuilder hintsBuilder = new StringBuilder();
            int count = 0;
            for (int i = 1; i <= 5; i++) {
                try {
                    Field field = row.getClass().getDeclaredField("lv1_block" + i);
                    field.setAccessible(true);
                    int blockValue = field.getInt(row);
                    if (blockValue == 1) {
                        count++;
                    } else {
                        if (count > 0) {
                            hintsBuilder.append(count).append(" ");
                            count = 0;
                        }
                    }
                } catch (NoSuchFieldException | IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
            if (count > 0) {
                hintsBuilder.append(count);
            }
            row.setHints(hintsBuilder.toString().trim());
        }
        
        model.addAttribute("rows", vo);
      
        return "nonogram";
    }
    
    // 각 행의 숫자 힌트를 계산하는 메서드
    private String calculateHints(NemoVO row) {
        StringBuilder hints = new StringBuilder();
        int consecutiveOnes = 0;
        for (int i = 1; i <= 5; i++) {
            try {
                Field field = row.getClass().getDeclaredField("lv1_block" + i);
                field.setAccessible(true);
                int block = field.getInt(row);
                if (block == 1) {
                    consecutiveOnes++;
                } else if (consecutiveOnes > 0) {
                    hints.append(consecutiveOnes).append(", ");
                    consecutiveOnes = 0;
                }
            } catch (NoSuchFieldException | IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        if (consecutiveOnes > 0) {
            hints.append(consecutiveOnes);
        }
        return hints.toString();
    }
}
