package com.care.root.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.care.root.member.session_name.MemberSessionName;
import com.care.root.notice.dto.NoticeRepDTO;
import com.care.root.notice.service.NoticeService;

@RestController
@RequestMapping("/notice")
public class NoticeRepController implements MemberSessionName{
	@Autowired NoticeService ns;
	@PostMapping(value="addReply", produces = "application/json; charset=utf-8")
	public void addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		
		NoticeRepDTO dto = new NoticeRepDTO();
		dto.setNoticeWriterId((String)session.getAttribute(LOGIN) );
		dto.setWrite_group( Integer.parseInt((String)map.get("notice_id")) );
		dto.setNoticeTitle((String)map.get("notice_title"));
		dto.setNoticeContent((String)map.get("notice_content"));
		
		ns.addReply(dto);
	}
	
	@GetMapping(value="replyData/{write_group}",produces = "application/json; charset=utf-8")
	public List<NoticeRepDTO> replyData(@PathVariable int write_group){
		return ns.getRepList(write_group);
	}
}

