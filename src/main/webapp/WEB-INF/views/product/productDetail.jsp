<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function fnMove(seq){ // 상품상세, 상품평, 상품문의 버튼들 누르면 화면 이동
	    var offset = $("#div" + seq).offset();
	    $('html, body').animate({scrollTop : offset.top}, 400);
	}
	
	function prdCnt(type){ // 수량 변경시 가격 변경
		const prdCnt = document.getElementById('productCnt');
		const price = document.getElementById('price');
		let number = prdCnt.innerText;
		let priceN = price.innerText;
		if(type === 'plus') {
		    number = parseInt(number) + 1;
		    priceN = parseInt(priceN) + ${productDetail.productNormalPrice };
		  }else if(type === 'minus')  {
			  if(number == '1'){
				  
			  }else{
				  number = parseInt(number) - 1;
				  priceN = parseInt(priceN) - ${productDetail.productNormalPrice };
			  }
		  }
		prdCnt.innerText = number;
		price.innerText = priceN;
	}
	
	function qna(){ // 문의하기 버튼 누르면 문의하기 띄우기
		document.getElementById("qna").style.display="block";
	}
	
	function movepage(page){ // 페이지 이동
	window.document.location.href=page;
	return;
	}
	
	function qnaAView(questionId){ // 문의 글 누르면 답글 보이기
		console.log(questionId)
		var test = {'questionId': questionId}
		var answer = document.getElementById('answer')
		$.ajax({
			url: "${contextPath }/qnaaview",
			type: "POST",
			data : JSON.stringify(test),
			contentType : "application/json; charset=utf-8",
			dataType: "json",
			success: function(data){
				console.log(data)
				answer.innerHTML = "<td>답변</td><td>작성자 : "+data.answerWriterId+"</td><td>내용 : "+data.answerContent+"</td><td>답변 생성 날짜 : "+data.answerCreateDate+"</td>";
			},
			error: function (){
				alert('답변이 없습니다.')
			}
		})
	}

	function insertCart(){
		var productCnt = document.getElementById('productCnt').innerText;
		var productCounts = parseInt(productCnt);
		console.log(productCnt);
		console.log('${productDetail.productId}');
		var hrefPage = "http://localhost:8085/root/product/insertcart/"+'${productDetail.productId}'+"/"+productCnt;
		window.document.location.href = hrefPage;
		return;
	}

</script>
<style type="text/css">
* {
	margin: 0;
}

.content {
	display: flex;
	flex-flow: column;
	width: 1200px;
	margin: auto;
	text-align: center;
	color: #00264d;
	/* border: 1px solid; */
}

.content .aside {
	display: flex;
	order: 1;
	margin: auto;
	width: 1200px;
	margin-top: 30px;
	margin-bottom: 50px;
}

.aside .primg {
	order: 1;
	width: 45%;
	margin-left: 45px;
	padding-top: 170px;
	border: 1px solid;
}

.aside .section {
	order: 2;
	width: 45%;
	margin-left: 30px;
	background: #f5f5f5;
	text-align: left;
	padding-left: 50px;
}

#qna {
	box-shadow: rgba(0, 0, 0, 0.5) 0 0 0 9999px, rgba(0, 0, 0, 0.5) 2px 2px
		3px 3px;
	z-index: 100;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="content">
		<br>
		<div>
			<h3>
				<b>상품 페이지</b>
			</h3>
			<div class="aside">

				<div class="primg">
					<img alt="이미지가 없습니다" style="width: 100px; height: 100px;"
						src="${pageContext.request.contextPath}/resources/img/${productDetail.productName}.jpg">
				</div>

				<div class="section">
					<br>
					<br>
					<div>
						<b>상품명 : </b>${productDetail.productName }</div>
					<br>
					<div>
						<b>가격 : </b><span id="price">${productDetail.productNormalPrice }</span>원
					</div>
					<br>
					<div>
						<b>평점 : ${productDetail.productScore }</b>
					</div>
					<br> <span><b>추천수 : </b>${productDetail.productRecommendCounts }</span>
					<%
					if (session.getAttribute("loginUser") != null) {
					%>
					<input type="button" value="+" onclick="#"><br>
					<%
					} else {
					%>
					<br>
					<%
					}
					%>
					<br> <span><b>수량 : </b></span> <input type="button" value="-"
						onclick='prdCnt("minus")'> <span id="productCnt">1</span> <input
						type="button" value="+" onclick='prdCnt("plus")'><br>
					<br> <input type="button" value="장바구니 담기" onclick="insertCart()">
					<input type="button" value="바로 구매" onclick="#"> <br>
					<br>
					<br>
				</div>
			</div>
			<hr>

			<div>
				<h4>
					<b>관련 상품들</b>
				</h4>
			</div>
			<br>
			<div class="aside2" id="relativeProduct">
				<table style="width: 99%;">
					<c:forEach var="relPro" items="${relPro}">
						<tr>
							<td rowspan="2"><a
								href="${contextPath }/product/productdetail/${relPro.productId }/${relPro.productCategory }/${relPro.productName}">
									<div class="pr"
										style="text-align: center; background: #f5f5f5; margin-left: 10px; width: 95%;">
										<br> <img alt="이미지가 없습니다" width="100px" height="100px"
											src="${pageContext.request.contextPath}/resources/img/${relPro.productName }.jpg"><br>
										상품명 : ${relPro.productName }<br> 가격 :
										${relPro.productNormalPrice } <br>
										<br>
									</div>
									<br>
							</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<hr>

			<div id="nav" style="width: 1200px;">
				<input type="button" value="상품상세" style="width: 33%;"
					class="btn btn-info" onclick="fnMove('1')"> <input
					type="button" value="상품평" style="width: 33%;" class="btn btn-light"
					onclick="fnMove('2')"> <input type="button" value="상품문의"
					style="width: 33%;" class="btn btn-dark" onclick="fnMove('3')">
			</div>
		</div>

		<div id="div1">
			<hr>
			<div>
				<h4>
					<b>상품상세</b>
				</h4>
			</div>
			<br>
			<div>상품 상세 내용</div>
			<%-- <br> <span>페이지 창을 길게 해서 (상품상세, 상품평, 상품문의) 버튼들의 기능들을 편하게
				보기 위해 여러개 넣어 놓았습니다.</span>--%>
			<div>${productPost.productFile1 }</div>
			<div>${productPost.productFile1 }</div>
			<div>${productPost.productFile1 }</div>
			<div>${productPost.productFile1 }</div>
			<div>${productPost.productFile2 }</div>
			<div>${productPost.productFile2 }</div>
			<div>${productPost.productFile2 }</div>
			<div>${productPost.productFile2 }</div>
			<div>${productPost.productFile3 }</div>
			<div>${productPost.productFile3 }</div>
			<div>${productPost.productFile3 }</div>
			<div>${productPost.productFile3 }</div>
		</div>
		<hr>

		<div id="div2">
			<div>
				<h4>
					<b>상품평</b>
				</h4>
			</div>
			<br>
			<div>
				<table border="1">
					<c:forEach var="rev" items="${review}">
						<a href='javascript:void(0);' onclick="#">
							<tr>
								<td><img alt="이미지가 없습니다" width="100px" height="100px"
									src="${pageContext.request.contextPath}/resources/img/${rev.productFile1 }.jpg">
								</td>
								<td><img alt="이미지가 없습니다" width="100px" height="100px"
									src="${pageContext.request.contextPath}/resources/img/${rev.productFile2 }.jpg">
								</td>
								<td><img alt="이미지가 없습니다" width="100px" height="100px"
									src="${pageContext.request.contextPath}/resources/img/${rev.productFile3 }.jpg">
								</td>
								<td><img alt="이미지가 없습니다" width="100px" height="100px"
									src="${pageContext.request.contextPath}/resources/img/${rev.productFile4 }.jpg">
								</td>
								<td><img alt="이미지가 없습니다" width="100px" height="100px"
									src="${pageContext.request.contextPath}/resources/img/${rev.productFile5 }.jpg">
								</td>
								<td>작성자 : ${rev.reviewWriterIdx }</td>
								<td>평점 : ${rev.productScore }</td>
								<td>상품 평점 등급 : ${rev.productDegree }</td>
								<td>상품평 제목 : ${rev.reviewTitle }</td>
								<td>상품평 내용 : ${rev.reviewContent }</td>
							</tr>
						</a>
					</c:forEach>
				</table>
				<c:forEach var="num" begin="1" end="${repeat }">
					<a
						href="${contextPath }/product/productdetail/${productDetail.productId }/${productDetail.productCategory }/${productDetail.productName }?num=${num}">${num }
						&nbsp;</a>
				</c:forEach>
			</div>
		</div>
		<hr>
		<br>

		<div id="div3">
			<div>
				<h4>
					<b>상품문의</b>
				</h4>
			</div>
			<br>
			<%
			if (session.getAttribute("loginUser") != null) {
			%>
			<input type="button" class="btn btn-outline-secondary" value="문의하기"
				onclick="qna()"><br>
			<%
			} else {
			%>
			<br>
			<%
			}
			%>
			<br>
			<div id="qna" style="text-align: center; background: #f5f5f5;">
				<table style="width: 90%;">
					<td><span><b>${productDetail.productName }</b></span><br>
					<br> <span><h5>문의 내용</h5></span>
						<form
							action="${contextPath }/product/addqnaq/${productDetail.productId }/${productDetail.productCategory }/${productDetail.productName }"
							method="post">
							<textarea class="form-control" rows="5" cols="20"
								style="margin-left: 60px;" name="questionContent"></textarea>
							<br> <input type="submit" value="등록"> <input
								type="button" value="취소" onclick='$("#qna").hide();'><br>
							<br>
						</form></td>
				</table>
			</div>
			<br>
			<c:forEach var="qnaq" items="${qnaq}">
				<a href='javascript:void(0);'
					onclick="qnaAView('${qnaq.questionId}');">
					<table class="table">
						<tr style="margin: -10px;">
							<td>문의</td>
							<td>작성자 : ${qnaq.questionWriterId }</td>
							<td>내용 : ${qnaq.questionContent }</td>
							<td>질문 생성 날짜 : ${qnaq.questionCreateDate }</td>
						</tr>
						<tr id="answer">
						</tr>
					</table>
				</a>
			</c:forEach>
			<hr>
		</div>

	</div>
	<c:import url="../default/footer.jsp" />
	<script type="text/javascript">
	$(document).ready(function() { // 상품상세, 상품평, 상품문의 버튼들 특정 위치부터 화면 고정
		document.getElementById("qna").style.display="none";
	    var nav = $('#nav').offset().top;
	    $(window).scroll(function() {
	    	if ($(this).scrollTop() >= nav) {
	    		$('#nav').css('position', 'fixed');
	    		$('#nav').css('top', '0');
	    	}else{
	    		$('#nav').css('position', 'absolute');
	    		$('#nav').css('top', nav);
	    	}
	    });
	})
	</script>
</body>
</html>