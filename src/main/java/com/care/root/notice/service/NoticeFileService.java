package com.care.root.notice.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.message.MessageDTO;

public interface NoticeFileService {
   public static final String IMAGE_REPO = "c:/kgitbank/image_repo";
   public String getMessage(int num, HttpServletRequest request);   
   public String saveFile(MultipartFile file);
   public String getMessage(MessageDTO dto);
   public void deleteImage(String noticeImageFileName);
   
}