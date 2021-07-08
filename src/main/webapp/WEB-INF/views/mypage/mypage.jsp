<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

* {
	margin: 0;
}

.content {
	display:flex; flex-flow:column;
	width:100%; margin:auto;
	text-align: center; color: #00264d;
}

.content .profile{
	width: 400px; padding: 30px 10px;
	margin:auto;
	margin-top:10px; margin-bottom:15px;
	border:1px solid #00264d;
}

.content .section1{
	display:flex; 
	order: 1;
	margin:auto;
	width: 400px;
	margin-bottom:15px;
}

.section1 .order{
	order:1; border:1px solid black;
	width: 48%; 
	padding: 30px 10px;
	background-color: white;
}

.section1 .wishlist {
	order:2; border:1px solid #00264d; 
	/* background-color:rgba(211, 211, 211, 0.2); */
	width: 48%;
	margin-left:4%;
	padding: 30px 10px;
 	background-color: white; 
}

.content .section2{
	display:flex; 
	order: 2;
	margin:auto;
	width: 400px;
}
.section2 .myboard {
	order:1; border:1px solid #00264d;
	width: 48%;
	padding: 30px 10px;	
	background-color: white;
}

.section2 .mileage {
	order:2; border:1px solid #00264d;
	width: 48%;
	margin-left:4%;
	padding: 30px 10px;
	background-color: white;
}

.content a{ color: grey; }
.content a:hover { color: #00264d; }

</style>
</head>
<body>
<c:import url="../default/header.jsp"/>

<div class="content">
		<div>
			<h3>M Y P A G E</h3> <hr><br>
			<h5><b>${loginUser }</b> 님! <br>
			저희 쇼핑몰을 이용해 주셔서 감사합니다.<br></h5>
			<br><br>
		</div>	
		
		<div class="profile"> 
			<a href="${contextPath}/member/profile">
			<h4><b>Profile</b></h4>
			<h6>회원 정보</h6>
			</a>
		</div>
		
		<div class="section1" style="color:green;">
			<nav class="order">
				<a href="${contextPath}/member/readOrders">
				<h4><b>Order</b></h4>
				<h6>주문 조회</h6>
				</a>
			</nav>
			<nav class="wishlist">
				<a href="${contextPath}/member/readWishes">
				<h4><b>Wish List</b></h4>
				<h6>관심 상품</h6>
				</a>
			</nav>
		</div>
		
		<div class="section2">	
			<nav class="myboard">
				<a href="${contextPath}/board/myboard">
				<h4><b>My Board</b></h4>
				<h6>게시물 관리</h6>
				</a>
			</nav>
			<nav class="mileage">
				<a href="${contextPath}/mypage/readMileage">
				<h4><b>Mileage</b></h4>
				<h6>적립금</h6>
				</a>
			</nav>
		</div>
</div>

	<c:import url="../default/footer.jsp"/>
</body>
</html>