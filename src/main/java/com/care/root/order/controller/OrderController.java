package com.care.root.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@GetMapping("/readOrders")
	public String readOrders() {
		return "eunbin/readOrders";
	}
	
}
