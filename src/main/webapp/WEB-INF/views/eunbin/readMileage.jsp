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

.content { display: flex; flex-flow: column; color:#00264d;
		   width: 100%; margin: auto;text-align: center; flex-direction: row; }
	
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

/* Mileage css */
.mileagebox { overflow-y: scroll; height: 550px;  width: 100%;
			background: white; padding-top: 10px;}

			/* scrollbar 관련 css*/
.content ::-webkit-scrollbar-track
	{ -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 5px; background-color: #F5F5F5; }
.content ::-webkit-scrollbar { width: 20px; background-color: #F5F5F5; }
.content ::-webkit-scrollbar-thumb { border-radius: 10px; 
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.5); background-color: #F5F5F5; }
	
	.margin10px {margin: 10px;}
	.textColorWhite{color: white;}
	.width100{width: 100%;}
	.width90{width: 90%;}
	.alignItemsFlexStart{align-items: flex-start;}
	.marginLeftRight10px{margin-left: 10px; margin-right: 10px}
	.overflowY{overflow-y :scroll;}
	.overflowX{overflow-x :scroll;}
	.height500px{max-height:500px;}

</style>
<body >
	<c:import url="../default/header.jsp"/>
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
		
		<!-- Mileage  -->
	    <div class="section">
			<br><br>
			<h3>M L I E A G E</h3><br><hr>
			<div class="mlieagebox">
	      
		      <div class="d-flex p-3 alignItemsFlexStart" style="background: #b3e0ff; ">
			      <div style="width: 48%; text-align:left; border-right: 1px dashed ; color: #00264d; " class="p-2">
				     <div>
					  <div class="p-2 "><b>• 총 적립금 : </b> ${UserTotalMileageCount }</div>
					  <div class="p-2 "><b>• 사용된 적립금 : </b> ${usedMileageCount }</div>
					  <div class="p-2 "><b>• 환불예정 적립금 : </b> ${refundExpectedMileageCount }</div>
					</div>
				  </div>
				  <div style="width: 48%; margin-left:10px; text-align:left; color: #00264d;"  class="p-2">
				     <div>
					  <div class="p-2 "><b>• 사용가능 적립금 : </b>${usableMileageCount }</div>
					  <div class="p-2 "><b>• 미가용 적립금 : </b>${unusedMileageCount }</div>
					</div>
				  </div>
			  </div>
		  <hr style="border-style: dashed ;">
	      <div class=" p-2" style="text-align: left;">
	      	<button type="button" class="btn btn-outline-secondary" style="width: 200px; margin-left: 18px;" 
	      	onclick="location.href='${contextPath }/mypage/readMileage'">적립내역 보기</button>
	      	<button type="button" class="btn btn-outline-secondary" style="width: 200px;" 
	      	onclick="location.href='${contextPath }/mypage/readUnusedMileage'">미가용 적립내역 보기</button>
	      </div>
	      <div class="p-2  height500px overflowY" style="height: 100%; margin: 17px;">
			  <table class="table width100">
			    <thead style="background:#f5f5f5; ">
			      <tr>
			        <th>주문날짜</th>
			        <th>적립금</th>
			        <th>주문번호</th>
	   		        <th>내용</th>
			      </tr>
			    </thead>
			    <tbody>	    
			    <c:if test="${userMileageList.size() == 0 }">
					 <div class="d-flex p-3 bg-secondary text-white alignItemsFlexStart">마일리지 내역 없음</div>
				</c:if>
			    <div class="width90 margin10px" >
				    <c:forEach var="mileageDto"  items="${userMileageList }"  varStatus="status">
					<c:set var="statusIndex" value="${status.index }" />
					      <tr class="width100 overflowX">
					        <td style="min-width:120px">${mileageDto.orderCreateDate }</td>
					        <td style="min-width:100px" >1</td>
					        <td >${mileageDto.orderId }</td>
			     		    <td style="min-width:160px">${mileageDto.mileageDetails }</td>
					      </tr>
				      </c:forEach>
			      </div>
			    </tbody>
			  </table>
		  </div>
  	      <div class="width90 p-2 marginLeftRight10px">
	      	<hr style="border-style: dashed ;">
	      </div>		
	      <!-- 
   	      <div class="width90 p-2 marginLeftRight10px">
	      	<ul style="display: flex; justify-content: center;"  class="pagination">
			  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
			  <li class="page-item"><a class="page-link" href="#">1</a></li>
			  <li class="page-item active"><a class="page-link" href="#">2</a></li>
			  <li class="page-item"><a class="page-link" href="#">3</a></li>
			  <li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
	      </div>
	       -->
	     </div>
	     </div>
	     
 		</div>
 		
 	</div>	
	<c:import url="../default/footer.jsp"/>
</body>
</html>