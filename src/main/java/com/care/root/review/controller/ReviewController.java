package com.care.root.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("review")
public class ReviewController {

	@GetMapping("/createReview")
	public String createReview(
														  HttpServletRequest request,
														  Model model,
														  @RequestParam(name= "orderProductId", required = false) String orderProductId,
														  @RequestParam(name="orderProductName", required = false) String orderProductName
														  )  throws Exception {
		
		HttpSession session = request.getSession();
		session.setAttribute("orderProductId", orderProductId );														
		session.setAttribute("orderProductName", orderProductName );
		
		model.addAttribute("orderProductId", orderProductId);
		model.addAttribute("orderProductName", orderProductName);
		
		return "eunbin/createReview";
	}

}
