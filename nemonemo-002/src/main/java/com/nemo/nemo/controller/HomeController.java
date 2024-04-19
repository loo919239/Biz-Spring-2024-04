package com.nemo.nemo.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nemo.nemo.dao.NemoDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private final NemoDao nemoDao;
	
	public HomeController(NemoDao nemoDao) {
		this.nemoDao = nemoDao;
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		List<NemoVO> vo = nemoDao.selectByNNum(1);
//		model.addAttribute("NEMO", vo );
		model.addAttribute("BODY","HOME");
		return "layout";
	}

	
}
