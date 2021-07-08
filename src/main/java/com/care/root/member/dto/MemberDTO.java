package com.care.root.member.dto;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

// 회원 
public class MemberDTO {
	    // 회원 인덱스 
	    private String memberIdx;

	    // 회원 이름 
	    private String memberName;

	    // 회원 이메일 
	    private String memberEmail;

	    // 회원 비밀번호 
	    private String memberPassword;

	    // 회원 역할 
	    private String memberRole;

	    // 회원 주소 //우편번호 입력칸 
	    private String memberAddress;
	    
	    // 회원 주소 // 주소 입력칸
	    private String memberAddress2;

	    // 회원 생성 날짜 
	    private Date memberCreateDate;

	    // 회원 적립금 
	    private int memberMileage;

	    // 회원 포인트 
	    private int memberPoint;

	    // 회원 아이디 
	    private String memberId;

	    // 회원 전화번호 
	    private String memberPhone;

	    // 회원 세션아이디 
	    private String memberSessionId;

	    // 회원 만료시간 
	    private Date memberLimitTime;

	    public String getMemberIdx() {
	        return memberIdx;
	    }

	    public void setMemberIdx(String memberIdx) {
	        this.memberIdx = memberIdx;
	    }

	    public String getMemberName() {
	        return memberName;
	    }

	    public void setMemberName(String memberName) {
	        this.memberName = memberName;
	    }

	    public String getMemberEmail() {
	        return memberEmail;
	    }

	    public void setMemberEmail(String memberEmail) {
	        this.memberEmail = memberEmail;
	    }

	    public String getMemberPassword() {
	        return memberPassword;
	    }

	    public void setMemberPassword(String memberPassword) {
	        this.memberPassword = memberPassword;
	    }

	    public String getMemberRole() {
	        return memberRole;
	    }

	    public void setMemberRole(String memberRole) {
	        this.memberRole = memberRole;
	    }

	    public String getMemberAddress() {
	        return memberAddress;
	    }

	    public void setMemberAddress(String memberAddress) {
	        this.memberAddress = memberAddress;
	    }

	    public Date getMemberCreateDate() {
	        return memberCreateDate;
	    }

	    public void setMemberCreateDate(Date memberCreateDate) {
	        this.memberCreateDate = memberCreateDate;
	    }

	    public int getMemberMileage() {
	        return memberMileage;
	    }

	    public void setMemberMileage(int memberMileage) {
	        this.memberMileage = memberMileage;
	    }

	    public int getMemberPoint() {
	        return memberPoint;
	    }

	    public void setMemberPoint(int memberPoint) {
	        this.memberPoint = memberPoint;
	    }

	    public String getMemberId() {
	        return memberId;
	    }

	    public void setMemberId(String memberId) {
	        this.memberId = memberId;
	    }

	    public String getMemberPhone() {
	        return memberPhone;
	    }

	    public void setMemberPhone(String memberPhone) {
	        this.memberPhone = memberPhone;
	    }

	    public String getMemberSessionId() {
	        return memberSessionId;
	    }

	    public void setMemberSessionId(String memberSessionId) {
	        this.memberSessionId = memberSessionId;
	    }

	    public Date getMemberLimitTime() {
	        return memberLimitTime;
	    }

	    public void setMemberLimitTime(Date memberLimitTime) {
	        this.memberLimitTime = memberLimitTime;
	    }

	    // Member 모델 복사
	    public void CopyData(MemberDTO param)
	    {
	        this.memberIdx = param.getMemberIdx();
	        this.memberName = param.getMemberName();
	        this.memberEmail = param.getMemberEmail();
	        this.memberPassword = param.getMemberPassword();
	        this.memberRole = param.getMemberRole();
	        this.memberAddress = param.getMemberAddress(); 
	        this.memberAddress2 = param.getMemberAddress2();
	        this.memberCreateDate = param.getMemberCreateDate();
	        this.memberMileage = param.getMemberMileage();
	        this.memberPoint = param.getMemberPoint();
	        this.memberId = param.getMemberId();
	        this.memberPhone = param.getMemberPhone();
	        this.memberSessionId = param.getMemberSessionId();
	        this.memberLimitTime = param.getMemberLimitTime();
	    }

		public String getMemberAddress2() {
			return memberAddress2;
		}

		public void setMemberAddress2(String memberAddress2) {
			this.memberAddress2 = memberAddress2;
		}


	}