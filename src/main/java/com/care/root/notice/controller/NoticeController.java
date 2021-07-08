package com.care.root.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.notice.service.NoticeFileService;
import com.care.root.notice.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired NoticeService ns;
	
	@GetMapping("noticeAllList") //공지사항 전체 리스트 / 페이징
	public String noticeAllList(Model model, 
			@RequestParam(value="num" , required = false, defaultValue = "1") int num) {
		System.out.println("num : "+num );
		ns.selectAllNoticeList(model, num);
		return "notice/noticeAllList";
	}
	
	@GetMapping("writeForm")
	public String writeForm() {
		return "notice/writeForm";
	}
	
	@PostMapping("writeSave")
	public void writeSave(MultipartHttpServletRequest mul,
							HttpServletRequest request,
							HttpServletResponse response) throws Exception{
			String message = ns.writeSave(mul, request);
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(message);
	}
	
	@GetMapping("contentView")
	public String contentView(@RequestParam int noticeId, Model model) {
		ns.contentView(noticeId, model);
		return "notice/contentView";
	}
	
	@GetMapping("download")
	public void downLoad(@RequestParam String noticeImageFileName, HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", 
				  "attachment;noticeImageFileName=" + noticeImageFileName);
	File file = new File(NoticeFileService.IMAGE_REPO+"/"+noticeImageFileName);
	FileInputStream in = new FileInputStream(file);
	FileCopyUtils.copy(in, response.getOutputStream());
	in.close();
	}
	
	@GetMapping("modify_form")
	public String modifyfrom(@RequestParam int noticeId, Model model) {
		ns.contentView(noticeId, model);
		return "notice/modify_form";
	}
	@PostMapping("modify")
	public void modify(MultipartHttpServletRequest mul,
						HttpServletResponse response,
						HttpServletRequest request) throws Exception{
		String message = ns.modify(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
	}
	
	@GetMapping("delete") // 공지사항 삭제
	public void noticeDelete(@RequestParam int noticeId, 
			@RequestParam String noticeImageFileName,
			HttpServletResponse response, //응답 메세지
			HttpServletRequest request) throws Exception  { //경로 가져오려고사용
		String message = ns.noticeDelete(noticeId,noticeImageFileName,request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message); // 성공,실패 메세지
	}
	
	
/*	@RequestMapping("search") 
	public ModelAndView list(@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="user_id") String search_option, 
			@RequestParam(defaultValue="") String keyword) throws Exception{
		int count = 1000;
		
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = page.getPageEnd();
		
		List
	}*/
	
	
}
