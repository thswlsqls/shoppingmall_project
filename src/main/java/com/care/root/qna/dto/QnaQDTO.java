package com.care.root.qna.dto;

import java.sql.Date;

// 구매자 질문 
public class QnaQDTO {

	    // 질문 아이디 
	    private String questionId;

	    // 질문 작성자 아이디 
	    private String questionWriterId;

	    // 상품 게시글 아이디 
	    private String productPostId;

	    // 질문 제목 
	    private String questionTitle;

	    // 질문 내용 
	    private String questionContent;

	    // 질문 생성 날짜 
	    private Date questionCreateDate;

	    // 질문 조회수 
	    private int questionViews;

	    public String getQuestionId() {
	        return questionId;
	    }

	    public void setQuestionId(String questionId) {
	        this.questionId = questionId;
	    }

	    public String getQuestionWriterId() {
	        return questionWriterId;
	    }

	    public void setQuestionWriterId(String questionWriterId) {
	        this.questionWriterId = questionWriterId;
	    }

	    public String getProductPostId() {
	        return productPostId;
	    }

	    public void setProductPostId(String productPostId) {
	        this.productPostId = productPostId;
	    }

	    public String getQuestionTitle() {
	        return questionTitle;
	    }

	    public void setQuestionTitle(String questionTitle) {
	        this.questionTitle = questionTitle;
	    }

	    public String getQuestionContent() {
	        return questionContent;
	    }

	    public void setQuestionContent(String questionContent) {
	        this.questionContent = questionContent;
	    }

	    public Date getQuestionCreateDate() {
	        return questionCreateDate;
	    }

	    public void setQuestionCreateDate(Date questionCreateDate) {
	        this.questionCreateDate = questionCreateDate;
	    }

	    public int getQuestionViews() {
	        return questionViews;
	    }

	    public void setQuestionViews(int questionViews) {
	        this.questionViews = questionViews;
	    }

	    // QnaQ 모델 복사
	    public void CopyData(QnaQDTO param)
	    {
	        this.questionId = param.getQuestionId();
	        this.questionWriterId = param.getQuestionWriterId();
	        this.productPostId = param.getProductPostId();
	        this.questionTitle = param.getQuestionTitle();
	        this.questionContent = param.getQuestionContent();
	        this.questionCreateDate = param.getQuestionCreateDate();
	        this.questionViews = param.getQuestionViews();
	    }
	}