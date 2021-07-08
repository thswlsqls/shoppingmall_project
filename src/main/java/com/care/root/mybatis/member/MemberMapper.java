package com.care.root.mybatis.member;

import java.util.ArrayList;
import java.util.Map;

import com.care.root.member.dto.MemberDTO;

public interface MemberMapper {
public int idCheck(String memberId);
	
	public String find_id(String email) throws Exception;
	public String find_pw(String id) throws Exception;
	
	public MemberDTO user_check(String id);
	public MemberDTO profile(String userId); //로그인 한 회원정보
	public ArrayList<MemberDTO> memberInfo();
	public MemberDTO info(String memberId);
	public int register(MemberDTO dto);
	public void keepLogin(Map<String, Object> map);
	public MemberDTO getUserSessionId(String sessionId);
	public void modify(MemberDTO dto); //회원정보 수정
	public void delete(String userId); //회원 탈퇴
}



