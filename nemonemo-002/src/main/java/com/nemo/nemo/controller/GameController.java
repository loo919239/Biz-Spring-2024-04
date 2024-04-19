package com.nemo.nemo.controller;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nemo.nemo.dao.NemoDao;
import com.nemo.nemo.dao.UserNemoDao;
import com.nemo.nemo.model.NemoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "game")
public class GameController {
private final NemoDao nemoDao;
private final UserNemoDao userNemoDao;
	
	public GameController(NemoDao nemoDao,UserNemoDao userNemoDao) {
		this.nemoDao = nemoDao;
		this.userNemoDao = userNemoDao;
	}

	@GetMapping("/nono1")
	public String nono1(Model model) {
	    List<NemoVO> vo = nemoDao.selectByNNum(1);
	    
	 // ���� ���� ��Ʈ�� �����ϴ� �κ�
	    List<String> colHints = new ArrayList<>();
	    for (int i = 1; i <= 15; i++) {
	        StringBuilder colHintBuilder = new StringBuilder();
	        int count = 0;
	        boolean hasValue = false; // 1�� ���� �ִ��� ���θ� Ȯ���ϴ� ����
	        for (NemoVO row : vo) {
	            try {
	                Field field = row.getClass().getDeclaredField("n_block" + i);
	                field.setAccessible(true);
	                int blockValue = field.getInt(row);
	                if (blockValue == 1) {
	                    count++;
	                    hasValue = true; // 1�� ���� ������ ǥ��
	                } else {
	                    if (count > 0) {
	                        colHintBuilder.append(count).append(" ");
	                        count = 0;
	                    }
	                }
	            } catch (NoSuchFieldException | IllegalAccessException e) {
	                e.printStackTrace();
	            }
	        }
	        // 1�� ���� ���� ��쿡�� 0�� �߰�
	        if (!hasValue && count > 0) {
	            colHintBuilder.append("0 ");
	        }
	        if (count > 0) {
	            colHintBuilder.append(count).append(" ");
	        }
	        colHints.add(colHintBuilder.toString().trim());
	    }

	    
	 // ���� ���� ��Ʈ�� �����ϴ� �κ�
	    for (NemoVO row : vo) {
	        StringBuilder hintsBuilder = new StringBuilder();
	        int count = 0;
	        boolean hasOne = false; // 1�� ���� �ִ��� ���θ� Ȯ���ϱ� ���� ����
	        for (int i = 1; i <= 15; i++) {
	            try {
	                Field field = row.getClass().getDeclaredField("n_block" + i);
	                field.setAccessible(true);
	                int blockValue = field.getInt(row);
	                if (blockValue == 1) {
	                    count++;
	                    hasOne = true; // 1�� ���� �ִ� ��� true�� ����
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
	            hintsBuilder.append(count).append(" ");
	        }
	        // 1�� ���� ���� ��쿡�� ���� ��Ʈ�� ����
	        if (!hasOne) {
	            hintsBuilder.append("0 ");
	        }
	        row.setHints(hintsBuilder.toString().trim());
	    }



	    
	    model.addAttribute("rows", vo);
	    model.addAttribute("colHints", colHints);
	  
	    return "nonogram";
	}





	
}
//	@RequestMapping(value = { "/", "" }, method = RequestMethod.GET)
//	public String game(Model model) {
//		List<NemoVO> vo = nemoDao.selectAll();
//		String p_id = "1";
//		String p_num = "5";
//		List<UserNemoVO> player = userNemoDao.selectAll(p_id, p_num);
//		model.addAttribute("VO", vo);
//		model.addAttribute("PLAYERLEVEL5", player);
//		model.addAttribute("BODY", "GAME");
//
//		return "layout";
//	}
