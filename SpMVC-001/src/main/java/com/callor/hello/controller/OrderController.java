package com.callor.hello.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.hello.models.OrderCustomerVO;
import com.callor.hello.persistance.OrderCustomerDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/order")
public class OrderController {

	private final OrderCustomerDao orderDao;
	public OrderController(OrderCustomerDao orderDao) {
		this.orderDao = orderDao;
	}
	
//	home 컨트롤러 제외 value = {"/",""} 해줘야
	@RequestMapping(value = {"/",""},method = RequestMethod.GET)
	public String home(Model model) {
		List<OrderCustomerVO> custList = orderDao.selectAll();
		log.debug(custList.toString());
		model.addAttribute("ORDER_LIST", custList);
		return "order/list";
	}
	
}
