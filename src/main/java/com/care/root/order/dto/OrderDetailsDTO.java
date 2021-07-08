package com.care.root.order.dto;

//주문 상세 
public class OrderDetailsDTO {

	 // 주문 아이디 
	 private String orderId;
	
	 // 배송 요구사항 
	 private String deleveryRequirement;
	
	 // 배송 주소 
	 private String deleveryAddress;
	
	 // 판매자 전화번호 
	 private int sellerPhone;
	
	 // 배송 상태 
	 private String deleveryStatus;
	
	 public String getOrderId() {
	     return orderId;
	 }
	
	 public void setOrderId(String orderId) {
	     this.orderId = orderId;
	 }
	
	 public String getDeleveryRequirement() {
	     return deleveryRequirement;
	 }
	
	 public void setDeleveryRequirement(String deleveryRequirement) {
	     this.deleveryRequirement = deleveryRequirement;
	 }
	
	 public String getDeleveryAddress() {
	     return deleveryAddress;
	 }
	
	 public void setDeleveryAddress(String deleveryAddress) {
	     this.deleveryAddress = deleveryAddress;
	 }
	
	 public int getSellerPhone() {
	     return sellerPhone;
	 }
	
	 public void setSellerPhone(int sellerPhone) {
	     this.sellerPhone = sellerPhone;
	 }
	
	 public String getDeleveryStatus() {
	     return deleveryStatus;
	 }
	
	 public void setDeleveryStatus(String deleveryStatus) {
	     this.deleveryStatus = deleveryStatus;
	 }
	
	 // OrderDetails 모델 복사
	 public void CopyData(OrderDetailsDTO param)
	 {
	     this.orderId = param.getOrderId();
	     this.deleveryRequirement = param.getDeleveryRequirement();
	     this.deleveryAddress = param.getDeleveryAddress();
	     this.sellerPhone = param.getSellerPhone();
	     this.deleveryStatus = param.getDeleveryStatus();
	 }
}