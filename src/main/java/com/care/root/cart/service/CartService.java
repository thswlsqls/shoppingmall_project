package com.care.root.cart.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface CartService {
	public String insertUserCart(HttpServletRequest request, 
														HttpSession session,
														int cartProductCounts,
														String cartProductId,
														String cartProductFile1,
														int cartProductPrice);
	public String getMessage(int num, HttpServletRequest request);
}
