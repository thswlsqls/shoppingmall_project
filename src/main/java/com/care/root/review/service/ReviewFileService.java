package com.care.root.review.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.message.MessageDTO;

public interface ReviewFileService {
	public static final String IMAGE_REPO = "c:/spring/image_repo";
	public String getMessage(int num, HttpServletRequest request);
	public String saveFile(MultipartFile file);
	public void deleteImage(String imageFileName);
	public String getMessage(MessageDTO dto);
}
