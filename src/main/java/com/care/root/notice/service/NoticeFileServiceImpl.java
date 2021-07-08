package com.care.root.notice.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.message.MessageDTO;

public class NoticeFileServiceImpl implements NoticeFileService{
   @Override
   public String getMessage(int num, HttpServletRequest request) {
      String message = null;
      if(num == 1) {
         message = "<script>alert('새글이 추가 되었습니다');";
         message += "location.href='"+request.getContextPath()+"/notice/noticeAllList';</script>";
      }else {
         message  = "<script>alert('문제가 발생했습니다!!!');";
         message += 
               "location.href='"+request.getContextPath()+"/notice/writeForm';</script>";
      }
      return message;
   }

   @Override
   public String saveFile(MultipartFile file) {
      SimpleDateFormat simpl = new SimpleDateFormat("yyyyMMddHHmmss-");
      Calendar calendar = Calendar.getInstance();
      String sysFileName = 
            simpl.format(calendar.getTime()) + file.getOriginalFilename();
      File saveFile = new File(IMAGE_REPO+"/"+sysFileName);
      try {
         file.transferTo(saveFile);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return sysFileName;
   }

   @Override
   public String getMessage(MessageDTO dto) {
      String message = null;
      String path = dto.getRequest().getContextPath();
      if(dto.getResult() == 1) {
         message = "<script>alert('"+dto.getSuccessMessage()+"');";
         message += "location.href='"+path+dto.getSuccessURL()+"'</script>";
      }else {
         message = "<script>alert('"+dto.getFailMessage()+"');";
         message += "location.href='"+path+dto.getFailURL()+"'</script>";
      }
      return message;
   }

   @Override
   public void deleteImage(String noticeImageFileName) {
      File file = new File(IMAGE_REPO+"/"+noticeImageFileName);
      file.delete();
      
   }

}