<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() { // 처음 카테고리 체크 설정
	    $("input:checkbox[id='all']").prop("checked", true);
	    $("input:checkbox[id='cat']").prop("checked", false);
	    $("input:checkbox[id='dog']").prop("checked", false);
	});
	function movepage(page){ // 페이지 이동
	window.document.location.href=page;
	return;
	}
</script>

<style type="text/css">
* {
   margin: 0;
}

.content {
   display:flex; flex-flow:column;
   width:100%; margin:auto;
   text-align: center;   color: #00264d;
}

.content .aside{
   display:flex; 
   order: 1;
   margin:auto;
   width: 1200px;
}

.aside .kategorie{
   order:1;
   width: 18%;
   padding-top: 150px; 
   background: #00264d; color: white; 
}

.kategorie .ka {
    /* border: 1px solid;  */ width: 95px;
    margin: auto; text-align: left; padding-bottom: 20px;
    }

.aside .product{
   order:2;
   width: 80%;
   /* background: #f5f5f5; */
   margin-left:50px;
   /* border:1px solid red; */
}
   .product a { color: black; }
   .product a:hover { color: #00264d; }
   #paging{ }

</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
<div class="content"> 				
	<div class="aside">
		<div class="kategorie">
			<h4><b>카테고리</b></h4><br><br>
			<div class="ka">
			<h6><b>수제간식</b></h6><hr style="border-color:white;">
			<input type="checkbox" id="all" name="kategorie" value="all" onclick="movepage('http://localhost:8085/root/product/allview');"> All <br>
			<input type="checkbox" id="dog" name="kategorie" value="dog" onclick="movepage('http://localhost:8085/root/product/dogview/dog');"> 강아지 <br>
			<input type="checkbox" id="cat" name="kategorie" value="cat" onclick="movepage('http://localhost:8085/root/product/catview/cat');"> 고양이 <br>
			</div>
		</div>
		<div class="product">
			<br><br>
			<h3>A L L</h3><br><hr style="background: #00264d; height: 1px;"><br>
			<a href="${contextPath }/product/recommendallview"> 인기도순 </a>&nbsp;&nbsp;｜&nbsp;&nbsp;
			<a href="${contextPath }/product/priceallview"> 낮은가격순 </a>&nbsp;&nbsp;｜&nbsp;&nbsp;
			<a href="${contextPath }/product/scoreallview"> 평점높은순 </a><br>
			<br><br>
			<div id="product">
			<table style="width: 100%; ">
				<c:forEach var="dto" items="${product}">
				<tr>
					<td rowspan="2" style="width: 50%;">
					<a href="${contextPath }/product/productdetail/${dto.productId}/${dto.productCategory}/${dto.productName}">
						<div class="pr" style="background:#f5f5f5; margin-left:10px; width:95%;"><br>
							<img alt="이미지가 없습니다" width="100px" height="100px"
								src="${pageContext.request.contextPath}/resources/img/${dto.productName}.jpg">
							<div>상품명 : ${dto.productName }</div>
							<div>가격 : ${dto.productNormalPrice }</div>
							<div>추천수 : ${dto.productRecommendCounts }</div>
							<div>평점 : ${dto.productScore }</div>
							<br>
						</div> <br>
					</a></td> </tr>
				</c:forEach>
				</table>
			</div>
			<div id="paging">
				<c:forEach var="num" begin="1" end="${repeat }">
					<a href="${contextPath }/product/priceallview?num=${num}">${num } &nbsp;</a>
				</c:forEach>
			</div>
		</div>
	</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>