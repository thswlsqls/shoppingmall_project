package com.care.root.productPost.dto;

import java.sql.Date;

// 상품 게시글 
public class ProductPostDTO {
	    // 상품 게시글 아이디 
	    private String productPostId;

	    // 상품 아이디 
	    private String productId;

	    // 상품 게시글 제목 
	    private String productPostTitle;

	    // 상품 게시글 상세설명 
	    private String productPostDescription;

	    // 상품 게시글 생성 날짜 저자 미상 포스트 가능
	    private Date productPostCreateDate;

	    // 상품 게시글 수정 날짜 
	    private Date productPostUpdateDate;

	    // 판매 개수 
	    private int sellCounts;

	    // 상품 파일 1 
	    private String productFile1;

	    // 상품 파일 2 
	    private String productFile2;

	    // 상품 파일 3 
	    private String productFile3;

	    public String getProductPostId() {
	        return productPostId;
	    }

	    public void setProductPostId(String productPostId) {
	        this.productPostId = productPostId;
	    }

	    public String getProductId() {
	        return productId;
	    }

	    public void setProductId(String productId) {
	        this.productId = productId;
	    }

	    public String getProductPostTitle() {
	        return productPostTitle;
	    }

	    public void setProductPostTitle(String productPostTitle) {
	        this.productPostTitle = productPostTitle;
	    }

	    public String getProductPostDescription() {
	        return productPostDescription;
	    }

	    public void setProductPostDescription(String productPostDescription) {
	        this.productPostDescription = productPostDescription;
	    }

	    public Date getProductPostCreateDate() {
	        return productPostCreateDate;
	    }

	    public void setProductPostCreateDate(Date productPostCreateDate) {
	        this.productPostCreateDate = productPostCreateDate;
	    }

	    public Date getProductPostUpdateDate() {
	        return productPostUpdateDate;
	    }

	    public void setProductPostUpdateDate(Date productPostUpdateDate) {
	        this.productPostUpdateDate = productPostUpdateDate;
	    }

	    public int getSellCounts() {
	        return sellCounts;
	    }

	    public void setSellCounts(int sellCounts) {
	        this.sellCounts = sellCounts;
	    }

	    public String getProductFile1() {
	        return productFile1;
	    }

	    public void setProductFile1(String productFile1) {
	        this.productFile1 = productFile1;
	    }

	    public String getProductFile2() {
	        return productFile2;
	    }

	    public void setProductFile2(String productFile2) {
	        this.productFile2 = productFile2;
	    }

	    public String getProductFile3() {
	        return productFile3;
	    }

	    public void setProductFile3(String productFile3) {
	        this.productFile3 = productFile3;
	    }

	    // ProductPost 모델 복사
	    public void CopyData(ProductPostDTO param)
	    {
	        this.productPostId = param.getProductPostId();
	        this.productId = param.getProductId();
	        this.productPostTitle = param.getProductPostTitle();
	        this.productPostDescription = param.getProductPostDescription();
	        this.productPostCreateDate = param.getProductPostCreateDate();
	        this.productPostUpdateDate = param.getProductPostUpdateDate();
	        this.sellCounts = param.getSellCounts();
	        this.productFile1 = param.getProductFile1();
	        this.productFile2 = param.getProductFile2();
	        this.productFile3 = param.getProductFile3();
	    }
	}