<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="wrap">
		<div style="width:300px; margin: 0 auto;">
			<table  align="center" class="table table-bordered" style="width:300px;">
				<tr>
					<th>아이디</th><td>${info.id }</td>
				</tr>
				<tr>
					<th>비밀번호</th><td>${info.pw }</td>
				</tr>
				<tr>
					<th>주 소</th><td>${info.addr }</td>
				</tr>
			</table>
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>



