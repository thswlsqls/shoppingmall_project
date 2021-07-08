package com.care.root.qna.dto;

import java.sql.Date;

//판매자 답변 
public class QnaADTO {
	
		// 답변 아이디 
	    private String answerId;

	    // 질문 아이디 
	    private String questionId;

	    // 답변 작성자 아이디 
	    private String answerWriterId;

	    // 답변 제목 
	    private String answerTitle;

	    // 답변 내용 
	    private String answerContent;

	    // 답변 생성 날짜 
	    private Date answerCreateDate;

	    // 답변 조회수 
	    private int answerViews;

	    public String getAnswerId() {
	        return answerId;
	    }

	    public void setAnswerId(String answerId) {
	        this.answerId = answerId;
	    }

	    public String getQuestionId() {
	        return questionId;
	    }

	    public void setQuestionId(String questionId) {
	        this.questionId = questionId;
	    }

	    public String getAnswerWriterId() {
	        return answerWriterId;
	    }

	    public void setAnswerWriterId(String answerWriterId) {
	        this.answerWriterId = answerWriterId;
	    }

	    public String getAnswerTitle() {
	        return answerTitle;
	    }

	    public void setAnswerTitle(String answerTitle) {
	        this.answerTitle = answerTitle;
	    }

	    public String getAnswerContent() {
	        return answerContent;
	    }

	    public void setAnswerContent(String answerContent) {
	        this.answerContent = answerContent;
	    }

	    public Date getAnswerCreateDate() {
	        return answerCreateDate;
	    }

	    public void setAnswerCreateDate(Date answerCreateDate) {
	        this.answerCreateDate = answerCreateDate;
	    }

	    public int getAnswerViews() {
	        return answerViews;
	    }

	    public void setAnswerViews(int answerViews) {
	        this.answerViews = answerViews;
	    }

	    // QnaA 모델 복사
	    public void CopyData(QnaADTO param)
	    {
	        this.answerId = param.getAnswerId();
	        this.questionId = param.getQuestionId();
	        this.answerWriterId = param.getAnswerWriterId();
	        this.answerTitle = param.getAnswerTitle();
	        this.answerContent = param.getAnswerContent();
	        this.answerCreateDate = param.getAnswerCreateDate();
	        this.answerViews = param.getAnswerViews();
	    }
	}
