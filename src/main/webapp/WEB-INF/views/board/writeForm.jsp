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
	function readURL(input){
		var file = input.files[0]
		console.log(file)
		if(file != ''){
			var reader = new FileReader();
			reader.readAsDataURL(file)
			reader.onload = function(e){
				console.log(e.target.result)
				$("#preview").attr("src", e.target.result)
			}
		}
	}
</script>
</head>
<body>
	<c:import url="../default/header.jsp"/>
<div class="wrap">
	<div style="width:400px; margin: 0 auto;">
	<form action="${contextPath }/board/writeSave" method="post" enctype="multipart/form-data">
		<div class="form-group">
  			<label for="witer">
  				<b>작성자</b><br>
  			</label>
		<input class="form-control" type="text" name="id" size="50" value="${loginUser }" readonly>
		</div>
		<hr>
		
		<div class="form-group">
  			<label for="title">
				<b>제목</b><br>
			</label>
		<input class="form-control" type="text" size="50" name="title" ><hr>
		</div>
		
		<div class="form-group">
  			<label for="content">
				<b>내용</b><br>
			</label>
			<textarea class="form-control" rows="10" cols="50" name="content"></textarea>
		</div>
		<hr>
		
		<label for="file">
			<b>이미지파일 첨부</b><br>
		</label>
		
		<div class="custom-file">
			<input type="file" name="image_file_name" onchange="readURL(this)" id="customFile">
			<label class="custom-file-label" for="customFile">Choose file</label>
		</div>
		<img id="preview" src="#" width="100" height="100" alt="선택 이미지 없음">
		<hr>
		<div class="form-group">
			<input class="form-control" type="submit" value="글쓰기">
		</div>
		<input class="form-control" type="button" value="목록이동"
			onclick="location.href='${contextPath}/board/boardAllList'">
	</form>
	</div>
</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>





