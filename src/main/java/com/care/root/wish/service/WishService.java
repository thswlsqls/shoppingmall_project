package com.care.root.wish.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface WishService {
	public void getUserWishes(Model model, HttpSession session);
	public void deleteUserWishes(String wishId,
																	HttpServletRequest request );
}
