package com.care.root.mileage.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MileageService {
	public void getUserMileageStateList(HttpServletRequest request, Model model, HttpSession session);
	public void getUserMileages(Model model, HttpSession session);
	public void getUserTotalMileage(Model model, HttpSession session);
	public void getUnusedUserMileages(Model model, HttpSession session);
	
}
