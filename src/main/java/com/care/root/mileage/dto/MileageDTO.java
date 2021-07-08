package com.care.root.mileage.dto;

import java.sql.Date;

//적립금 
public class MileageDTO {

 // 적립금 아이디 
 private String mileageId;

 // 적립금 상태 
 private String mileageStatus;

 // 적립금 상세 
 private String mileageDetails;

 // 주문 아이디 
 private String orderId;

 // 주문 생성 날짜 
 private Date orderCreateDate;

 // 회원 인덱스 
 private String memberIdx;

 public String getMileageId() {
     return mileageId;
 }

 public void setMileageId(String mileageId) {
     this.mileageId = mileageId;
 }

 public String getMileageStatus() {
     return mileageStatus;
 }

 public void setMileageStatus(String mileageStatus) {
     this.mileageStatus = mileageStatus;
 }

 public String getMileageDetails() {
     return mileageDetails;
 }

 public void setMileageDetails(String mileageDetails) {
     this.mileageDetails = mileageDetails;
 }

 public String getOrderId() {
     return orderId;
 }

 public void setOrderId(String orderId) {
     this.orderId = orderId;
 }

 public Date getOrderCreateDate() {
     return orderCreateDate;
 }

 public void setOrderCreateDate(Date orderCreateDate) {
     this.orderCreateDate = orderCreateDate;
 }

 public String getMemberIdx() {
     return memberIdx;
 }

 public void setMemberIdx(String memberIdx) {
     this.memberIdx = memberIdx;
 }

 // Mileage 모델 복사
 public void CopyData(MileageDTO param)
 {
     this.mileageId = param.getMileageId();
     this.mileageStatus = param.getMileageStatus();
     this.mileageDetails = param.getMileageDetails();
     this.orderId = param.getOrderId();
     this.orderCreateDate = param.getOrderCreateDate();
     this.memberIdx = param.getMemberIdx();
 }
}
