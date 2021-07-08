package com.care.root.order.service;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.order.OrderMapper;
import com.care.root.order.dto.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired OrderMapper mapper;
	@Override
	public void getUserOrdersDeleveryStates(HttpServletRequest request, 
																						  Model model, 
																						  HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("userSessionData");
		String LoginUserIdx = dto.getMemberIdx();
		ArrayList<String> deleveryStateList = mapper.getUserOrdersDeleveryStates(LoginUserIdx);
		model.addAttribute("deleveryStateList", deleveryStateList);
		deleveryStateList.forEach((deleveryState) -> System.out.println(deleveryState));
		System.out.println(deleveryStateList);
	
		int beforeDepositStateCount = Collections.frequency(deleveryStateList, "입금전");
		int readyToDeleveryStateCount = Collections.frequency(deleveryStateList, "배송준비중");
		int onDeleveryStateCount = Collections.frequency(deleveryStateList, "배송중");
		int DeleveryOverStateCount = Collections.frequency(deleveryStateList, "배송완료");

		model.addAttribute("beforeDepositStateCount", beforeDepositStateCount);
		model.addAttribute("readyToDeleveryStateCount", readyToDeleveryStateCount);
		model.addAttribute("onDeleveryStateCount", onDeleveryStateCount);
		model.addAttribute("DeleveryOverStateCount", DeleveryOverStateCount);
	}

	@Override
	public void getUserOrders(Model model, 
															HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("userSessionData");
		String LoginUserIdx = dto.getMemberIdx();
		ArrayList<OrderDTO> userOrderList = mapper.getUserOrders(LoginUserIdx);
		model.addAttribute("userOrderList", userOrderList);
		userOrderList.forEach((order)->System.out.println(order.getOrderProductName()));
	}
}
