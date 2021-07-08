package com.care.root.notice.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.member.session_name.MemberSessionName;
import com.care.root.message.MessageDTO;
import com.care.root.mybatis.notice.NoticeMapper;
import com.care.root.notice.dto.NoticeDTO;
import com.care.root.notice.dto.NoticeRepDTO;

@Service
public class NoticeServiceImpl implements NoticeService{   
   @Autowired NoticeMapper mapper;
   @Override
   public void selectAllNoticeList(Model model, int num) { //num페이지 번호
      int allCount = mapper.selectNoticeCount(); //글 총 개수 얻어오기
      int pageLetter = 5; //한 페이지에 10개의 글 표현
      int repeat = allCount /pageLetter; //몫
      if(allCount % pageLetter != 0) {// 0과 같으면 페이지수가 딱 떨어져서 그대로 두겠다.
         repeat += 1;
      }
         int end = num * pageLetter;
         int start = end + 1 - pageLetter;
         model.addAttribute("repeat", repeat);
         model.addAttribute("noticeList", mapper.selectAllNoticeList(start, end));
   }
   
   @Override
   public String writeSave(MultipartHttpServletRequest mul, 
            HttpServletRequest request) {
      NoticeDTO dto = new NoticeDTO();
      dto.setNoticeTitle(mul.getParameter("notice_title"));
      dto.setNoticeContent(mul.getParameter("notice_content"));
      HttpSession session = request.getSession();
      dto.setNoticeWriterId((String)session.getAttribute(MemberSessionName.LOGIN));
      
      MultipartFile file = mul.getFile("notice_image_file_name");
      
      NoticeFileService nfs = new NoticeFileServiceImpl();
      
      if( file.isEmpty() ) { // 파일이 비워있으면 true
         dto.setNoticeImageFileName("nan");
      }else { //파일이 존재하는 경우
         dto.setNoticeImageFileName( nfs.saveFile(file) );
      }
      return nfs.getMessage(mapper.writeSave(dto), request);
   }
   
   @Override
   public void contentView(int noticeId, Model model) {
      model.addAttribute("personalData", mapper.contentView(noticeId));      
      noticeViews(noticeId);
   }
   
   private void noticeViews(int noticeId) {
      mapper.noticeViews(noticeId);
   }

   @Override
   public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
      NoticeDTO dto = new NoticeDTO();
      dto.setNoticeId(Integer.parseInt(mul.getParameter("notice_id")));
      dto.setNoticeTitle(mul.getParameter("notice_title"));
      dto.setNoticeContent(mul.getParameter("notice_content"));
      
      MultipartFile file = mul.getFile("notice_image_file_name");
      NoticeFileService nfs = new NoticeFileServiceImpl();
      
      if( file.isEmpty()) { 
         dto.setNoticeImageFileName(mul.getParameter("originFileName"));
      }else { 
         dto.setNoticeImageFileName(nfs.saveFile(file)); 
         nfs.deleteImage(mul.getParameter("originFileName"));

      }
      int result = mapper.modify(dto);
      
      MessageDTO mDto = new MessageDTO();
      mDto.setResult(result);
      mDto.setRequest(request);
      mDto.setSuccessMessage("성공적으로 수정 되었습니다");
      mDto.setSuccessURL("/notice/noticeAllList");
      mDto.setFailMessage("수정 중 문제가 발생하였습니다");
      mDto.setFailURL("/notice/modify_form");

      return nfs.getMessage(mDto);
   }
   
   @Override
   public void addReply(NoticeRepDTO dto) {
      mapper.addReply(dto);
   }
   public List<NoticeRepDTO> getRepList(int write_group){
      return mapper.getRepList(write_group);
   }

   @Override
   public String noticeDelete(int noticeId, String noticeImageFileName, HttpServletRequest request) {
      NoticeFileService nfs = new NoticeFileServiceImpl();
      int result = mapper.delete(noticeId);
      
      MessageDTO dto = new MessageDTO();
      
      if(result == 1) {
         nfs.deleteImage(noticeImageFileName);
      }
      dto.setRequest(request);
      dto.setResult(result);
      dto.setSuccessMessage("성공적으로 삭제 되었습니다");
      dto.setSuccessURL("/notice/noticeAllList");
      dto.setFailMessage("삭제 중 문제가 발생하였습니다");
      dto.setFailURL("/notice/contentView");
      
      return nfs.getMessage(dto);
   }
   
   
}