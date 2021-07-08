package com.care.root.admin.dto;

// 관리자 저자에 관한 정보를 저장하는 테이블
public class AdminDTO {

	    // 관리자 아이디 아이디는 번호로 구성
	    private String adminId;

	    // 관리자 이메일 실제 이름이 아니라 닉네임 같은 이름
	    private String adminEmail;

	    // 관리자 비밀번호 실제 이름
	    private String adminPassword;

	    // 관리자 이름 실제 이름
	    private String adminName;

	    public String getAdminId() {
	        return adminId;
	    }

	    public void setAdminId(String adminId) {
	        this.adminId = adminId;
	    }

	    public String getAdminEmail() {
	        return adminEmail;
	    }

	    public void setAdminEmail(String adminEmail) {
	        this.adminEmail = adminEmail;
	    }

	    public String getAdminPassword() {
	        return adminPassword;
	    }

	    public void setAdminPassword(String adminPassword) {
	        this.adminPassword = adminPassword;
	    }

	    public String getAdminName() {
	        return adminName;
	    }

	    public void setAdminName(String adminName) {
	        this.adminName = adminName;
	    }

	    // Admin 모델 복사
	    public void CopyData(AdminDTO param)
	    {
	        this.adminId = param.getAdminId();
	        this.adminEmail = param.getAdminEmail();
	        this.adminPassword = param.getAdminPassword();
	        this.adminName = param.getAdminName();
	    }
	}
