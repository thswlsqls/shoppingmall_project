package com.care.root.review.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ReviewService {
	public String reviewSave(MultipartHttpServletRequest mul,
													  HttpServletRequest request,
													  String orderProductId);
	
}
