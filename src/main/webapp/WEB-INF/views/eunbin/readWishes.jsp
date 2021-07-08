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

/* Wish css */
.wishlistbox { overflow-y: scroll; height: 550px;  width: 100%;
			background: white; padding-top: 10px;}

			/* scrollbar 관련 css*/
.content ::-webkit-scrollbar-track
	{ -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 5px; background-color: #F5F5F5; }
.content ::-webkit-scrollbar { width: 20px; background-color: #F5F5F5; }
.content ::-webkit-scrollbar-thumb { border-radius: 10px; 
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.5); background-color: #F5F5F5; }


.wishlist1 {width: 100%; margin:10px; }	

	.margin10px {margin: 10px;}
	.height550px{max-height:550px;}
	
	.textColorWhite{color: white;}
	.width90{width: 90%;}
	.width50{width: 50%;}
	.displayFlex { display: flex; }
	.floatRight{float: right;}
	.floatLeft{float: left;}
	.alignItemsFlexStart{align-items: flex-start;}

	.minHeight234px{min-height: 234px;}
	.maxHeight234px{max-height: 234px;}
	.minWidth300px{min-width: 300px;}

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
		<!-- WISH LIST -->
		<div class="section">
			<br><br>
			<h3>W I S H L I S T</h3><br><hr>
			<div class="wishlistbox">	
			
	     		<c:if test="${userWishList.size() == 0 }">
			 		<div class="width100 p-2 margin10px margin10px" style="background: #f5f5f5;">WISH 내역 없음</div>
		  		</c:if>
		  		
		  	<div class="wishlist1">
			  	<c:forEach var="wishDto"  items="${userWishList }"  varStatus="status">
				<c:set var="statusIndex" value="${status.index }" />
					<div style="min-width:700px; width: 95%;" class="p-2">
				      <div class="d-flex p-3 alignItemsFlexStart">
						  <div class="width50 p-2  minHeight234px maxHeight234px">
						  	<div style="height:100%;">
					  			<img style="max-width: 320px" class="card-img-top minWidth300px maxHeight234px" src="<tags:url value='/resources/img/${wishDto.wishName}.jpg'/>" alt="Card image">
					  		</div>
					      </div>
						  <div style="width:50%; height:250px; text-align: left;" class="p-2">
						     <div class="d-flex flex-column">
							  <div class="p-2"><b>상품명 : </b>${wishDto.wishName } </div><br>
							  <div class="p-2"><b>수량 : </b>${wishDto.wishCounts } </div><br>
							  <div class="p-2"><b>가격 : </b>${wishDto.wishTotalPrice }</div><br>
							</div>
							<br>
							<div style="margin-left: 10px;"  class="form-check">
					  		  <input class="form-check-input" 
					  		  				type="checkbox" 
					  		  				value=${wishDto.wishId}
					  		  				id="wishCheck"
					  		  				onclick="getCheckboxValue(event)">
							  <label class="form-check-label" for="flexCheckDefault">
							    상품 선택
							  </label>
							</div>
						  </div>
					  </div>
					  <br>
					  <hr style="border-style: dashed ;">
			      </div>
		      </c:forEach>
	      </div>    
	     </div>
	     <br>
	     <div>
	      	<button type="button"  
	      					id="wishDeleteBtn" 
	      					class="btn btn-outline-secondary margin10px floatLeft" >
	      					삭제
			</button>
	      	<button type="button" 
	      					 class="btn btn-outline-secondary margin10px floatLeft"
	      					 onclick="location.href='${contextPath }/cart/insertUserCart?cartProductCounts=${orderDto.orderCounts}&
	      					 																														   cartProductId=${orderDto.orderProductId}&
	      					 																														   cartProductFile1=${orderDto.orderProductName}.jpg&
	      					 																														   cartProductPrice=${orderDto.totalPrice}" disabled>
	      					장바구니 담기
	      	</button><!-- 이미 구현된 기능임, 불필요 -->
	      	<button type="button" 
	      					 style="width: 300px;" 
	      					 class="btn btn-outline-secondary margin10px floatRight"
	      					 onclick="location.href='${contextPath }/review/createReview?cartProductCounts=${orderDto.orderCounts}&
	      					 																														   cartProductId=${orderDto.orderProductId}&
	      					 																														   cartProductFile1=${orderDto.orderProductName}.jpg&
	      					 																														   cartProductPrice=${orderDto.totalPrice}'" disabled>
	      					주문하기
	      	</button><!-- 이미 구현된 기능임, 불필요 -->
	     </div>
 		</div>
 	</div>
 	</div>	
	<c:import url="../default/footer.jsp"/>
</body>
<script type="text/javascript">

	var set = new Set();
	var map = new Map();
	function getCheckboxValue(event){
		if(event.target.checked){
			set.add(event.target.value);
			console.log(set);
		}else{
			set.delete(event.target.value);
			console.log(set);
		}
	}
	
	$(document).on('click', '#wishDeleteBtn', function(){
		console.log("삭제 버튼 클릭")
		console.log(set);
		var userWishList = new Array();
		userWishList =  "${userWishList}";
		
		console.log(userWishList)
		
			set.forEach((wishId, index)=>{
			var variables = {"wishId": wishId}
			$.ajax({
				url: "/root/wish/deleteUserWishes", 
				type: "POST", 
				data: JSON.stringify(variables),
				contentType: "application/json; charset=utf-8",
				dataType : "text",
				success: function(data){
					alert("선택한wish를 성공적으로 삭제했습니다."); 
				}, error: function(e){
					console.log(e);
					alert("전송에 실패했습니다.");
				}
			})
		})
	})

</script>
</html>