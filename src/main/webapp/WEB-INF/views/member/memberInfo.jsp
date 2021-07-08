<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../default/header.jsp" />
		<div class="wrap">
			<h1 style="text-align: center;">회 원 정 보</h1>
			<table class="table" >
				<tr>
					<th>아이디</th><th>비밀번호</th><th>주소</th><th>이름</th><th>이메일</th><th>전화번호</th>
				</tr>
				<c:forEach var="dto" items="${memberList}">
					<tr>
						<td>
							<a href="${contextPath }/member/info?memberId=${dto.memberId }">${dto.memberId }</a>
						</td>
						<td>${dto.memberPassword }</td>
						<td>${dto.memberAddress }</td>
						<td>${dto.memberName }</td>
						<td>${dto.memberEmail }</td>
						<td>${dto.memberPhone }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	<jsp:include page="../default/footer.jsp" />
</body>
</html>