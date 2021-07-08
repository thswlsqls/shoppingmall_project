package com.care.root.notice.dto;

import java.sql.Timestamp;

public class NoticeRepDTO {
	private String noticeWriterId;
	private String noticeTitle;
	private String noticeContent;
	private int write_group;
	private Timestamp write_date;
	
	public String getNoticeWriterId() {
		return noticeWriterId;
	}
	public void setNoticeWriterId(String noticeWriterId) {
		this.noticeWriterId = noticeWriterId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public int getWrite_group() {
		return write_group;
	}
	public void setWrite_group(int write_group) {
		this.write_group = write_group;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	
}
