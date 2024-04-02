package com.callor.hello.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.hello.models.CustomVO;
import com.callor.hello.persistance.CustomDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	
	private final CustomDao customDao;
	public CustomerController(CustomDao customDao) {
		this.customDao = customDao;
	}
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public String home(Model model) {
		List<CustomVO> custList = customDao.selectAll();
		model.addAttribute("CUST_LIST", custList);
		return "customer/list";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		return "customer/input";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(CustomVO vo, Model model) {
		int result = customDao.insert(vo);
		try {
			if(result > 0) {
				return "redirect:/customer";
			}else {
				model.addAttribute("MSG", "INSERT ERROR");
				return "customer/input";
			}
			
		} catch (Exception e) {
			model.addAttribute("MSG", "INSERT ERROR");
			return "customer/input";
		}
		
	}
	
	/*
	 * 거래처 코드를 전달받아 거래처를 SELECT 하고
	 * SELECT 한 거래처 정보를 Detail 화면에서 알려주기
	 */
	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detaile(@RequestParam("c_code") String cCode, Model model,
			@RequestParam(name = "msg", required = false, defaultValue = "OK") String msg) {
		CustomVO customVO = customDao.findById(cCode);
		model.addAttribute("CUST", customVO);
		model.addAttribute("MSG",msg);
		return "customer/detail";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(@RequestParam("ccode") String cCode, Model model) {
		CustomVO customVO = customDao.findById(cCode);
		model.addAttribute("CUST", customVO);
		return "customer/input";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(CustomVO customVO) {
		log.debug("Update {}", customVO.toString());
		int result = customDao.update(customVO);
		String retString = String.format("redirect:/customer/detail?c_code=%s",
						customVO.getC_code());
		return retString;
//		return "redurect:/customer/detail?c_code=" + customVO.getC_code();
	}
	/*
	 * URL(URI) 에 부착된 변수 갑 추출하기
	 * @PathVariable("이름")으로 값을 추출한다
	 */
	@RequestMapping(value = "/delete/{ccode}", method = RequestMethod.GET)
	public String delete(@PathVariable("ccode") String cCode) {
		int result = 0;
		try {
			result = customDao.delete(cCode);
			
		} catch (Exception e) {
			return "redirect:/customer/detail?c_code=" + cCode + "&msg=FK";
		}
		if (result > 0) {
			return "redirect:/customer";
		} else {
			return "redirect:/customer/detail?c_code=" + cCode + "&msg=NOT";
		}
	}
}
