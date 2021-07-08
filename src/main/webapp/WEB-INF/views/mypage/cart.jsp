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
<style type="text/css">
* {
	margin: 0;
}

.content{
	display:flex; flex-flow:column;
	width:1200px; margin:auto;
	text-align: center;
	/* border: 1px solid red; */
}

    .checkBoxTd {
        max-width: 57px;
    }

    .checkBox {
        height: 70px;
    }

    .itemImageTd {
        max-width: 230px;
        max-height: 230px;
    }

    .itemImage {
        max-width: 100px;
        max-height: 70px;
    }

    .itemInfoTd {
        max-width: 347px;
    }

    .itemPriceTd {
        max-width: 173px;
        max-height: 100px;
    }

    .orderCountTd {
        max-width: 65px;
        max-height: 100px;
    }

    .orderCount {
        max-width: 40px;
    }

    .totalPriceTd {
        max-width: 173px;
        max-height: 100px;
    }
/* th {
	background: black;
	color: white;
}
 */
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var price = 0;
		<c:forEach var="cart" items="${cart}">
			price = ${cart.cartProductPrice } * ${cart.cartProductCounts }
			document.getElementById('${cart.cartId }').innerHTML = price;
		</c:forEach>
	});
	function allCheck(){
		var checkAll = document.getElementById('checkAll').checked;
		<c:forEach var="cart" items="${cart}">
		if(checkAll){
			$("input:checkbox[id='${cart.cartId }${cart.cartId }${cart.cartId }']").prop("checked", true);
		}else{
			$("input:checkbox[id='${cart.cartId }${cart.cartId }${cart.cartId }']").prop("checked", false);
		}
		</c:forEach>
	}
	function update(){
		
	}
	function check1(){
		fo.submit();
	}
	function resetPrice(){
		var orderPrice = document.getElementById('orderPrice');
		var orderPriceInt = 0;
		var delPrice = document.getElementById('delPrice');
		var delPriceInt = 2500;
		var totalPrice = document.getElementById('totalPrice');
		<c:forEach var="cart" items="${cart}">
			var check = document.getElementById('${cart.cartId }${cart.cartId }${cart.cartId }').checked;
			var productCounts = document.getElementById('${cart.cartId }${cart.cartId }').value;
			var price = ${cart.cartProductPrice} * productCounts;
			document.getElementById('${cart.cartId }').innerHTML = price;
			if(check){
				orderPriceInt += price;
			}
		</c:forEach>
		orderPrice.innerHTML = orderPriceInt;
		delPrice.innerHTML = delPriceInt;
		totalPrice.innerHTML = orderPriceInt + delPriceInt;
	}
</script>
</head>
<body>
<c:import url="../default/header.jsp"/>
<div class="content"> 
		<div>
			<h3>C A R T</h3><br>
		</div>
		<div class="cartContainer">
		<form id="fo" action="${contextPath}/mypage/cart" method="get">
        <table class="table">
            <th><input id="checkAll" type="checkbox" onclick="allCheck()"></th>
            <th>이미지</th>
            <th>상품정보</th>
            <th>상품금액</th>
            <th>수량</th>
            <th>총 금액</th>
            <c:forEach var="cart" items="${cart}">
            <tr>
                <td class="checkBoxTd">
                    <input type="checkbox" name="chtest" class="checkBox" value="${cart.cartProductId }" onclick="resetPrice()" id="${cart.cartId }${cart.cartId }${cart.cartId }">
                </td>
                <td class="itemImageTd">
                	<img class="logo" src="${pageContext.request.contextPath}/resources/img/${cart.cartProductFile1}.jpg" width="100px;" > 
                </td>
                <td class="itemInfoTd" >   
                ${cart.cartProductId }         
                </td>
                <td class="itemPriceTd">
                ${cart.cartProductPrice }
                </td>
                <td class="orderCountTd">
                    <!-- itemId를 가져오기 위한 필드 -->
                    <input class="itemId" type="text" style="display: none;" value=""
                           name="itemId">
                    <input class="orderCount" type="number" value="${cart.cartProductCounts }" min="1"
                           name="orderCount" id="${cart.cartId }${cart.cartId }"> 
                    <input type="button" class="btn btn-light orderCountModifyBtn" value="수정" onclick="update()">
                    <button type="button" class="close removeCartItemBtn" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </td>
                <td class="totalPriceTd" id="${cart.cartId }">
                    <%-- <span
                        th:text="${#numbers.formatInteger(cartLine.itemPrice * cartLine.orderCount, 3, 'COMMA')}">
                        </span> --%>
                </td>
            </tr>
            </c:forEach>
        </table>
        </form>
    </div>
	<hr>
    <div style="text-align: left;">
    	<button id="orderBtn" class="btn btn-primary" onclick="check1()">선택삭제</button>
    	<!-- <button id="orderBtn" class="btn btn-primary">전체삭제</button> -->
        <button id="orderBtn" class="btn btn-primary">구매하기</button>
    </div>
    <br>
    
    <div>
    	<hr>
    	주문금액 : <div id="orderPrice"></div><br>
    	배송비 : <div id="delPrice"></div><hr>
    	합계 : <div id="totalPrice"></div>
    </div>
	
</div>

<c:import url="../default/footer.jsp"/>
</body>
</html>