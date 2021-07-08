package com.care.root.order.dto;

import java.sql.Date;

//주문 
public class OrderDTO {

	 // 주문 아이디 
	 private String orderId;
	
	 // 구매자 아이디 
	 private String buyerIdx;
	
	 // 주문 상품 아이디 
	 private String orderProductId;
	
	 // 주문 개수 
	 private int orderCounts;
	
	 // 주문 생성 날짜 
	 private Date orderCreateDate;
	
	 // 총 가격 
	 private int totalPrice;
	
	 // 결제수단 
	 private String payment;
	
	 // 주문 상품 이름 
	 private String orderProductName;
	
	 public String getOrderId() {
	     return orderId;
	 }
	
	 public void setOrderId(String orderId) {
	     this.orderId = orderId;
	 }
	
	 public String getBuyerIdx() {
	     return buyerIdx;
	 }
	
	 public void setBuyerId(String buyerIdx) {
	     this.buyerIdx = buyerIdx;
	 }
	
	 public String getOrderProductId() {
	     return orderProductId;
	 }
	
	 public void setOrderProductId(String orderProductId) {
	     this.orderProductId = orderProductId;
	 }
	
	 public int getOrderCounts() {
	     return orderCounts;
	 }
	
	 public void setOrderCounts(int orderCounts) {
	     this.orderCounts = orderCounts;
	 }
	
	 public Date getOrderCreateDate() {
	     return orderCreateDate;
	 }
	
	 public void setOrderCreateDate(Date orderCreateDate) {
	     this.orderCreateDate = orderCreateDate;
	 }
	
	 public int getTotalPrice() {
	     return totalPrice;
	 }
	
	 public void setTotalPrice(int totalPrice) {
	     this.totalPrice = totalPrice;
	 }
	
	 public String getPayment() {
	     return payment;
	 }
	
	 public void setPayment(String payment) {
	     this.payment = payment;
	 }
	
	 public String getOrderProductName() {
	     return orderProductName;
	 }
	
	 public void setOrderProductName(String orderProductName) {
	     this.orderProductName = orderProductName;
	 }
	
	 // Orders 모델 복사
	 public void CopyData(OrderDTO param)
	 {
	     this.orderId = param.getOrderId();
	     this.buyerIdx = param.getBuyerIdx();
	     this.orderProductId = param.getOrderProductId();
	     this.orderCounts = param.getOrderCounts();
	     this.orderCreateDate = param.getOrderCreateDate();
	     this.totalPrice = param.getTotalPrice();
	     this.payment = param.getPayment();
	     this.orderProductName = param.getOrderProductName();
	 }
}