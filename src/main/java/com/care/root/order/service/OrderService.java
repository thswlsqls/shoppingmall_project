package com.care.root.order.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface OrderService {
	public void getUserOrdersDeleveryStates(HttpServletRequest request, Model model, HttpSession session);
	public void getUserOrders(Model model, HttpSession session);
	
}
