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
	<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
	<c:import url="../default/header.jsp" />
		<div class="wrap">
			<div align="right">
				<form action="${contextPath }/member/user_check" method="post">
					<table>
						<tr>
							<td>
								<div class="form-group">
	  								<input class="form-control" type="text" name="id" placeholder="input id">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<input class="form-control" type="password" name="pw" placeholder="input password">
								</div>	
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="form-group">
									<input class="form-control" type="submit" value="로그인">
									<a href="${contextPath }/member/register_form">회원가입</a>
										
									<div class="custom-control custom-checkbox">
										<input id="customCheck" class="custom-control-input" type="checkbox" name="autoLogin">
										<label class="custom-control-label" for="customCheck">로그인유지</label>
									</div>
								</div>
								<br>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>






