<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function readURL(input){
		var file = input.files[0]
		console.log(file)
		if(file != ''){
			var reader = new FileReader();
			reader.readAsDataURL(file)
			reader.onload = function(e){
				console.log(e.target.result)
				$("#preview").attr("src",e.target.result)
			}
		}
	}
</script>
</head>
<body>
<c:import url="../default/header.jsp"></c:import>
<div class="wrap">
	<div style="width:300px; margin: 0 auto;">
		<form action="${contextPath }/board/modify" enctype="multipart/form-data" method="post">
			
			<input type="hidden" name="writeNo" value="${personalData.writeNo }">
			
			<input type="hidden" name="originFileName" value="${personalData.imageFileName }">
			<div class="form-group">
  			<label for="witer">
  				<b>제목</b>
  			</label>
  			</div>
  			<div class="form-group">
				<input type="text" size="30" name="title" value="${personalData.title }"><br>
			</div>
			내용 <textarea rows="5" cols="30" name="content">${personalData.content }</textarea>
			<hr>
			<c:if test="${personalData.imageFileName != 'nan' }">
				<img width="100px" heigh="100px" id="preview"
					src="${contextPath }/board/download?imageFileName=${personalData.imagefileName}">
			</c:if>
			<input type="file" name="imageFileName" onchange="readURL(this)"><hr>
			<input type="submit"  value="수정"><hr>
			<input type="button" onchange="history.back()" value="돌아가기">
			
		</form>
	</div>
</div>
<c:import url="../default/footer.jsp"></c:import>

</body>
</html>