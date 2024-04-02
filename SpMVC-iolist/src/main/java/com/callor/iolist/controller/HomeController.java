package com.callor.iolist.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.iolist.models.IoListVO;
import com.callor.iolist.persistance.IoListDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private final IoListDao ioListDao;
	public HomeController(IoListDao ioListDao) {
		this.ioListDao = ioListDao;
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<IoListVO> ioList = ioListDao.selectAll();
		model.addAttribute("IO_LIST", ioList);
		return "home";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		return "iolist/input";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(IoListVO vo, Model model) {
		int result = ioListDao.insert(vo);
		try {
			if(result > 0) {
				return "redirect:/";
			}else {
				return "iolist/input";
			}
			
		} catch (Exception e) {
			return "iolist/input";
		}
		
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detaile(@RequestParam("io_seq") String ioSeq, Model model) {
		IoListVO ioListVO = ioListDao.findById(ioSeq);
		model.addAttribute("IO", ioListVO);
		return "iolist/detail";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(@RequestParam("seq") String ioSeq, Model model) {
		IoListVO ioListVO = ioListDao.findById(ioSeq);
		model.addAttribute("IO", ioListVO);
		return "iolist/input";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(IoListVO ioListVO) {
//		log.debug("Update {}", ioListVO.toString());
		int result = ioListDao.update(ioListVO);
		String retString = String.format("redirect:/detail?io_seq=%s",
				ioListVO.getIo_seq());
		return retString;
//		return "redurect:/customer/detail?c_code=" + customVO.getC_code();
	}
	
	@RequestMapping(value = "/delete/{seq}", method = RequestMethod.GET)
	public String delete(@PathVariable("seq") String ioSeq) {
		int result = 0;
			result = ioListDao.delete(ioSeq);
			return "redirect:/";
	
	}
}
