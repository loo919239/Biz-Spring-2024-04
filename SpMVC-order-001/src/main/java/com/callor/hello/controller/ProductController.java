package com.callor.hello.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.hello.models.CustomVO;
import com.callor.hello.models.ProductVO;
import com.callor.hello.persistance.ProductDao;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	private final ProductDao productDao;
	public ProductController(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	@RequestMapping(value = {"/",""} , method = RequestMethod.GET)
	public String Home(Model model) {
	List<ProductVO> proList = productDao.selectAll();
	model.addAttribute("PRODUCT_LIST", proList);
	return "product/list";
	}
	
	@RequestMapping(value = "/insert", method =RequestMethod.GET)
	public String insert() {
		return "product/input";
	}
	@RequestMapping(value = "/insert", method =RequestMethod.POST)
	public String insert(ProductVO productVO, Model model) {
		int result = productDao.insert(productVO);
		try {
			if(result > 0) {
				return "redirect:/product";
			}else {
				model.addAttribute("MSG", "INSERT ERROR");
				return "product/input";
			}
			
		} catch (Exception e) {
			model.addAttribute("MSG", "INSERT ERROR");
			return "product/input";
		}
	}
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail (@RequestParam("p_code") String pCode, Model model,
			@RequestParam(name = "msg", required = false, defaultValue = "OK") String msg) {
		ProductVO productVO = productDao.findById(pCode);
		model.addAttribute("PRODUCT", productVO);
		model.addAttribute("MSG",msg);
		return "product/detail";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(@RequestParam("pcode") String pCode, Model model) {
		ProductVO productVO = productDao.findById(pCode);
		model.addAttribute("PRODUCT", productVO);
		return "product/input";
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ProductVO productVO) {
		int result = productDao.update(productVO);
		String retString = String.format("redirect:/product/detail?p_code=%s",
						productVO.getP_code());
		return retString;
	}
	@RequestMapping(value = "/delete/{pcode}", method = RequestMethod.GET)
	public String delete(@PathVariable("pcode") String pCode) {
		int result = 0;
		try {
			result = productDao.delete(pCode);
			
		} catch (Exception e) {
			return "redirect:/customer/detail?p_code=" + pCode + "&msg=FK";
		}
		if (result > 0) {
			return "redirect:/customer";
		} else {
			return "redirect:/customer/detail?p_code=" + pCode + "&msg=NOT";
		}
	}
}
