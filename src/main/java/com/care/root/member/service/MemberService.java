package com.care.root.member.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.member.dto.MemberDTO;

public interface MemberService {
	public int idCheck(String memberId);	 
	public String find_id(HttpServletResponse response, String email) throws Exception;
	public String find_pw(HttpServletResponse response, String id) throws Exception;
	public int user_check(HttpServletRequest request, Model model, HttpSession session);
	public void memberInfo(Model model);
	public void profile(Model model, String userId);  // 로그인한 회원 정보
	public void info(String userId, Model model);
	public int register(MemberDTO dto);
	
	public void keepLogin(String sessionId, Date limitDate, String id);
	
	public MemberDTO getUserSessionId(String sessionId);
	
	public void modify(HttpServletRequest request); // 회원정보 수정
	public void delete(String userId); // 회원 탈퇴
}
