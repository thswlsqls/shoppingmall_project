package com.care.root.notice.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.notice.dto.NoticeRepDTO;

public interface NoticeService {
   public void selectAllNoticeList(Model model, int num);

   public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);

   public void contentView(int noticeId, Model model);

   public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);
   
   public void addReply(NoticeRepDTO dto);
   
   public List<NoticeRepDTO> getRepList(int write_group);

   public String noticeDelete(int noticeId, String noticeImageFileName, HttpServletRequest request);
}