package com.care.root.wish.dto;

//관심 상품 
public class WishDTO {

	 // 관심상품 아이디 
	 private String wishId;
	
	 // 구매자 인덱스 
	 private String buyerIdx;
	
	 // 관심상품 이름 
	 private String wishName;
	
	 // 관심상품 총 가격 
	 private int wishTotalPrice;
	
	 // 관심상품 개수 
	 private int wishCounts;
	
	 public String getWishId() {
	     return wishId;
	 }
	
	 public void setWishId(String wishId) {
	     this.wishId = wishId;
	 }
	
	 public String getBuyerIdx() {
	     return buyerIdx;
	 }
	
	 public void setBuyerIdx(String buyerIdx) {
	     this.buyerIdx = buyerIdx;
	 }
	
	 public String getWishName() {
	     return wishName;
	 }
	
	 public void setWishName(String wishName) {
	     this.wishName = wishName;
	 }
	
	 public int getWishTotalPrice() {
	     return wishTotalPrice;
	 }
	
	 public void setWishTotalPrice(int wishTotalPrice) {
	     this.wishTotalPrice = wishTotalPrice;
	 }
	
	 public int getWishCounts() {
	     return wishCounts;
	 }
	
	 public void setWishCounts(int wishCounts) {
	     this.wishCounts = wishCounts;
	 }
	
	 // Wish 모델 복사
	 public void CopyData(WishDTO param)
	 {
	     this.wishId = param.getWishId();
	     this.buyerIdx = param.getBuyerIdx();
	     this.wishName = param.getWishName();
	     this.wishTotalPrice = param.getWishTotalPrice();
	     this.wishCounts = param.getWishCounts();
	 }
}