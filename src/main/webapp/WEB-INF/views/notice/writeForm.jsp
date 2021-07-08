<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0]
		console.log(file)
		if (file != '') {
			var reader = new FileReader();
			reader.readAsDataURL(file)
			reader.onload = function(e) {
				console.log(e.target.result)
				$("#preview").attr("src", e.target.result)
			}
		}
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
	border: 1px solid #f5f5f5 ;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<c:import url="../default/header.jsp" />
	<div class="content">
		<br><br>
		<h4>N O T I C E</h4>
		<br><hr style="background:#b3d7ff; height: 1px;"><br>
		<div style="width: 700px; text-align: left; margin: 0 auto;">
			<form action="${contextPath }/notice/writeSave" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="witer"> <b>아이디</b>
					</label> <input class="form-control" style="background-color: #b3d7ff; color: black;" type="text" size="40" name="notice_writer_id"
						value="${loginUser }" readonly>
				</div>
				<hr>
				<div class="form-group">
					<label for="title"> <b>제 목</b>
					</label> <input class="form-control" type="text" size="40" name="notice_title">
				</div>
				<hr>
				<div class="form-group">
					<label for="content"> <b>내용</b><br>
					</label>
					<textarea class="form-control" rows="10" cols="50" name="notice_content"></textarea>
				</div>
				<hr>

				<label for="file"> <b>이미지파일 첨부</b><br>
				</label>

				<div class="custom-file">
					<input type="file" name="notice_image_file_name"
						onchange="readURL(this)" id="customFile"> 
						<label class="custom-file-label" for="customFile">사진 첨부 </label>
				</div>
				<img id="preview" src="#" width="100" height="100" alt="선택 이미지 없음">
				<hr>
				<div class="form-group">
					<input class="form-control" type="submit" value="글쓰기">
				</div>
				<input class="form-control" type="button" value="목록이동"
					onclick="location.href='${contextPath}/notice/noticeAllList'">
			</form>
		
		<br><br>
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>