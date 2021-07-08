<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjspapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath }/resources/daumPost_js/daumpost.js"></script>
<script>
function register(){
	addr1 = $("#addr1").val()
	addr2 = $("#addr2").val()
	addr3 = $("#addr3").val()
	addr = addr1 + "/" + addr2 + "/" + addr3;
	$("#addr1").val(addr)
	fo.submit()
}
</script>

</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
		<div style="width:300px; margin: 0 auto;">
			<form action="register" method="post">
				<table class="table table-bordered" tyle="width:300px;">
					<tr>
						<td>
							<div class="form-group">
								<input class="form-control" type="text" name="id" placeholder="input id">
							</div>
							<div class="form-group">
								<input class="form-control" type="password" name="pw" placeholder="input password">
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="addr" placeholder="input address">
							</div>
							<div class="form-group">
								<input class="form-control" type="submit" value="register">
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>