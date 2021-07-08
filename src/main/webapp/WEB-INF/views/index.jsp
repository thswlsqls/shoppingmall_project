<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="default/header.jsp" />
	<div class="wrap content">
		<table class="mainTable" style="width:450px; margin: 0 auto;">
			<tr>
				<td>
					<img src="${pageContext.request.contextPath}/resources/img/mainlogo.jpg" width="950px" height="500px">
				</td>
			</tr>
		</table>
	</div>
	<c:import url="default/footer.jsp" />
</body>
</html>