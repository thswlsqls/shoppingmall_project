<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
	<%@ taglib  uri="http://www.springframework.org/tags" prefix="tags" %> 
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
* { margin: 0; }

.content { display: flex; flex-flow: column;
		   width: 100%; margin: auto;text-align: center;  color:#00264d; }
	
/* menu css */
.content .aside {
	display: flex;
	order: 1;
	margin: auto;
	width: 1200px;
	margin-bottom: 15px;
}

.aside .menu {
	order: 1;
	width: 18%;
	padding-top: 140px;
}

.aside .section {
	order: 2;
	width: 81%;
	margin-left: 80px;
	border: 1px solid #f5f5f5;
}

ul li { display: flex; }
.menu-nav { height: 120px; width: 200px; background-color: white; }
.p { border: 1px solid #00264d; padding-top: 8px; }
.content a { color: grey; }
.content a:hover { color: #00264d; }


/* ORDER css */

.orderbox { overflow-y: scroll; height: 400px; width: 100%;
			background: white; padding-top: 10px;}

			/* scrollbar 관련 css*/
.content ::-webkit-scrollbar-track
	{ -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 5px; background-color: #F5F5F5; }
.content ::-webkit-scrollbar { width: 20px; background-color: #F5F5F5; }
.content ::-webkit-scrollbar-thumb { border-radius: 10px; 
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.5); background-color: #F5F5F5; }


.section_nav { color: #00264d; 
				padding-left:15px;
				text-align: left; }

.bolderRight { border-right: 1px solid grey; }

.displayFlex { display: flex; }

.justifyContent { justify-content: space-around; }

.width100 { width: 100%; }
.width50 { width: 50%; }

.alignItemsFlexStart {align-items: flex-start; }/**/

.minHeight234px { min-height: 234px; }
.maxHeight234px { max-height: 234px; }
.minWidth300px { min-width: 300px; }

.borderTopBottom { border-top: 1px solid grey; border-bottom: 1px solid grey; }

.marginTopBottom10px { margin-top: 10px; margin-bottom: 10px; }

.width300px { width: 300px;}

</style>
<body >
	<c:import url="../default/header.jsp" />
	<div class="content">

		<!-- menu -->
		<div class="aside">
			<div class="menu">
				<ul>
					<li>
						<div class="menu-nav">
							<a class="nav-link" href="${contextPath }/mypage/readOrders">
								<div class="p">
									<div class="p-2">
										<b>Order</b>
									</div>
									<div class="p-2">주문 조회</div>
								</div>
							</a>
						</div>
					</li>
					<li>
						<div class="menu-nav">
							<a class="nav-link" href="${contextPath}/member/profile">
								<div class="p">
									<div class="p-2">
										<b>Profile</b>
									</div>
									<div class="p-2">회원 정보</div>
								</div>
							</a>
						</div>
					</li>
					<li>
						<div class="menu-nav">
							<a class="nav-link" href="${contextPath }/mypage/readWishes">
								<div class="p">
									<div class="p-2">
										<b>Wishlist</b>
									</div>
									<div class="p-2">관심 상품</div>
								</div>
							</a>
						</div>
					</li>
					<li>
						<div class="menu-nav">
							<a class="nav-link" href="${contextPath }/mypage/readMileage">
								<div class="p">
									<div class="p-2">
										<b>Mileage</b>
									</div>
									<div class="p-2">적립금</div>
								</div>
							</a>
						</div>
					</li>
					<li>
						<div class="menu-nav">
							<a class="nav-link" href="#">
								<div class="p">
									<div class="p-2">
										<b>My board</b>
									</div>
									<div class="p-2">게시물 관리</div>
								</div>
							</a>
						</div>
					</li>
				</ul>
			</div>


			<!-- 주문 정보 ORDER -->
			<div class="section">
				<br><br>
				<h3>O R D E R S</h3>
				<br><hr>
				<h2>${deleveryStates }</h2>
				<br>
				<div class="section_nav"><b>■ 주문 처리 현황</b>&nbsp;(최근 3개월 기준)</div>
				<hr style="border: 1px solid #00264d; ">
				<div style="color: #00264d;">
					<div class="justifyContent width100 d-flex p-3">
						<div class="p-2 bolderRight width100">
							<div class="d-flex flex-column">
								<div class="p-2">
									<b>입금전</b>
								</div>
								<div class="p-2">${beforeDepositStateCount }</div>
							</div>
						</div>
						<div class="p-2 bolderRight width100">
							<div class="d-flex flex-column">
								<div class="p-2">
									<b>배송준비중</b>
								</div>
								<div class="p-2">${readyToDeleveryStateCount }</div>
							</div>
						</div>
						<div class="p-2 bolderRight width100">
							<div class="d-flex flex-column">
								<div class="p-2">
									<b>배송중</b>
								</div>
								<div class="p-2">${onDeleveryStateCount }</div>
							</div>
						</div>
						<div class="p-2 width100">
							<div class="d-flex flex-column ">
								<div class="p-2">
									<b>배송완료</b>
								</div>
								<div class="p-2">${DeleveryOverStateCount }</div>
							</div>
						</div>
					</div>
				</div>
				<hr style="border-style: dashed ;">
				<div class="section_nav"><b>■ 주문 상품 상세보기</b></div>
				<hr style="border: 1px solid #00264d; ">
				

				<div class="orderbox">
				<c:if test="${userOrderList.size() == 0 }">
					<div class="d-flex p-3 alignItemsFlexStart" style="background:#f5f5f5;">주문내역 없음</div>
				</c:if>
					<c:forEach var="orderDto" items="${userOrderList }" varStatus="status">
						<c:set var="statusIndex" value="${status.index }" />
						
						<div class="width100 p-2 margin10px margin10px">
							<div class="width100 p-2 margin10px borderTopBottom positionRelative"
								style="text-align: left;">
								<sapn>주문번호</sapn> &nbsp; &nbsp; <span>${orderDto.orderId }</span> 
								<span style="margin-right: 10px; float:right;" >&nbsp;&nbsp;&nbsp;${orderDto.orderCreateDate }</span>
								<sapn style="position: relative; float:right;">주문일자</sapn>
							</div>
							
							<div style="color: black; position: relative; min-width: 700px"
								class="d-flex p-3  text-white alignItemsFlexStart">
								<div class="width50 p-2  minHeight234px maxHeight234px">
									<div style="height: 100%;">
										<img class="card-img-top minWidth300px maxHeight234px"
											src="<tags:url value='/resources/img/${orderDto.orderProductName}.jpg  '/>"
											alt="Card image" >
									</div>
								</div>
								<div style="color: black; position: relative; text-align: left;  class="width50 p-2">
									<div class="d-flex flex-column" style="padding-top:20px; padding-left: 20px; ">
										<div><b>상품명</b> : &nbsp;${orderDto.orderProductName }</div><br>
										<div><b>수 량</b> : &nbsp; ${orderDto.orderCounts }</div><br>
										<div><b>가 격</b> : &nbsp; ${orderDto.totalPrice }</div><br>
										<div style="color: #0066cc">
											<b>배송 상태 &nbsp; - &nbsp; ${deleveryStateList[status.index]} </b>
										</div>
										<br>
										<button 
											onclick="location.href='${contextPath }/review/createReview?orderProductId=${orderDto.orderProductId}&orderProductName=${orderDto.orderProductName }'"
											type="button" class="btn btn-outline-secondary width300px">
											상품 후기 작성 <a href="${contextPath }/review/createReview"></a>
										</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>