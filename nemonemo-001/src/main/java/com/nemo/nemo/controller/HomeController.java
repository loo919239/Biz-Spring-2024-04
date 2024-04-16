package com.nemo.nemo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nemo.nemo.dao.NemoDao;
import com.nemo.nemo.model.NemoVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}



    // 노노그램 데이터베이스에서 데이터를 가져온다고 가정
    private final NemoDao nemoDao;
    public HomeController(NemoDao nemoDao) {
    	this.nemoDao = nemoDao;
	}
    

    @GetMapping("/")
    public String showNonogram(Model model, NemoVO nemoVO) {
        // 데이터베이스에서 노노그램 데이터를 가져옴
        List<NemoVO> vo = nemoDao.selectAll();
        
        // JSP에 데이터 전달
        model.addAttribute("VO", vo);
        
        // JSP 파일 이름 반환
        return "nonogram";
    }
	
	
}
