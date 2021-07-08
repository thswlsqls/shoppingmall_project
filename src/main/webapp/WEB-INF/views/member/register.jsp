<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> <!-- 외부파일 가져오는 경로 -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath }/resources/daumPost_js/daumpost.js"></script>
<script>

function register(){
	 addr1 = $("#addr1").val()
     addr2 = $("#addr2").val()
     addr3 = $("#addr3").val()
     addr = addr1+"/"+addr2+"/"+addr3
     $("#addr1").val(addr)
     fo.submit()
}
</script>

</head>
<body>
	<c:import url="../default/header.jsp" />
		<div class="wrap">
			<div style="width: 300px; margin: 0 auto;">
				<form id="fo" action="register" method="post">
					<table border="1" style="width:300px;">
						<tr>
							<td>
								<input size="30" type="text" name="mameberId" placeholder="input id"><br>
								<input size="30" type="password" name="memberPassword" placeholder="input password"><br>
								<input size="30" type="password" name="pw1" placeholder="input password"><br>
								<input size="30" type="text" name="memberName" placeholder="input name"><br>
								<input size="30" type="text" name="memberPhone" placeholder="input phone"><br>
								<input size="30" type="text" name="memberEmail" placeholder="input email"><br>
								<input size="15" type="text" id="addr1" name="memberAddress" placeholder="우편번호">
								<input type="button" onclick="daumPost()" value="우편번호 검색"><br>
								<input type="text" id="addr2" name="memberAddress2" placeholder="주 소"><br>
								<input type="text" id="addr3" placeholder="상 세 주 소"><br>
								<input type="button" onclick="register()" value="register">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>