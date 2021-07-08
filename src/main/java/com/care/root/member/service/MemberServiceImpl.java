package com.care.root.member.service;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired MemberMapper mapper;
	public int user_check(HttpServletRequest request, 
												 Model model,
												 HttpSession session) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		MemberDTO dto = mapper.user_check(request.getParameter("memberId"));
		if(dto != null) {
			//if(request.getParameter("pw").equals(dto.getPw())) {
			if(encoder.matches(request.getParameter("memberPassword"), dto.getMemberPassword()) ||
								request.getParameter("memberPassword").equals(dto.getMemberPassword())) {
				model.addAttribute("userDataOnThisPageRequest", mapper.user_check(request.getParameter("memberId")));
				session.setAttribute("userSessionData", mapper.user_check(request.getParameter("memberId")));
				return 0;
			}
		}
		return 1;
		
	}
	// 로그인한 회원 정보
		public void profile(Model model, String userId) {
			MemberDTO list = mapper.profile(userId);
			model.addAttribute("memberList", list);
			//model.addAttribute("memberList", mapper.memberInfo());
		}
	public void memberInfo(Model model) {
		ArrayList<MemberDTO> list = mapper.memberInfo();
		model.addAttribute("memberList", list);
		//model.addAttribute("memberList", mapper.memberInfo());
	}
	public void info(String memberId, Model model) {
		model.addAttribute("info",mapper.info(memberId)) ;
	}
	public int register(MemberDTO dto) {
		dto.setMemberId(dto.getMemberId());
		/*
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		//dto.setPw(encoder.encode(dto.getPw()));
		System.out.println("비밀번호 변경 전 : "+dto.getMemberPassword());
		String pw = encoder.encode(dto.getMemberPassword());
		System.out.println("암호화 후 : "+pw);
		*/
		dto.setMemberIdx(UUID.randomUUID().toString().replace("-", "")); 
		
		dto.setMemberPassword(dto.getMemberPassword());
		dto.setMemberName(dto.getMemberName());
		dto.setMemberPhone(dto.getMemberPhone());
		dto.setMemberAddress(dto.getMemberAddress());
		dto.setMemberAddress2(dto.getMemberAddress2());
		dto.setMemberEmail(dto.getMemberEmail());
		
		dto.setMemberLimitTime(new Date(System.currentTimeMillis()));
		dto.setMemberSessionId("nan");
		
		dto.setMemberRole("user");
		Date createDate = new Date(System.currentTimeMillis());
		dto.setMemberCreateDate(createDate);
		
		try {
			return mapper.register(dto);
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	//로그인 한 회원정보 수정
		public void modify(HttpServletRequest request) {
			 
			MemberDTO dto = new MemberDTO();
			dto.setMemberId((String)request.getParameter("id"));
			dto.setMemberPassword((String)request.getParameter("pw"));
			dto.setMemberPhone((String)request.getParameter("phone"));
			dto.setMemberEmail((String)request.getParameter("email"));
			dto.setMemberAddress((String)request.getParameter("memberAddress"));		
			dto.setMemberAddress2((String)request.getParameter("memberAddress2"));		
			mapper.modify(dto);
		}
		
		//로그인 한 회원 탈퇴	
		  public void delete(String userId) {
			  mapper.delete(userId);
				/* model.addAttribute("delete", list); */
			  }
	
	public void keepLogin(String memberSessionId, Date memberLimitTime, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberSessionId", memberSessionId);
		map.put("memberLimitTime", memberLimitTime);
		map.put("memberId", memberId);
		mapper.keepLogin(map);
	}
	public MemberDTO getUserSessionId(String memberSessionId) {
		return mapper.getUserSessionId(memberSessionId);
	}
	@Override
	public int idCheck(String memberId) {
		return mapper.idCheck(memberId);
	}
	
	//아이디 찾기
	@Override
	public String find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = mapper.find_id(email);
		
		if(id == null) {
			out.println("<script>");
			out.println("alert('가입된 이메일이 없습니다');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
		
	}
	
	// 비밀번호 찾기
	@Override
	public String find_pw(HttpServletResponse response, String id) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String pw = mapper.find_pw(id);
		
		if(id == null) {
			out.println("<script>");
			out.println("alert('가입된 이메일이 없음');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return pw;
		}
		
	}
}








