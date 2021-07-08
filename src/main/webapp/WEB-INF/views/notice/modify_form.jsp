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
		var file = input.files[0] //파일에 대한 정보
		console.log(file)
		if(file != ''){
			var reader = new FileReader();
			reader.readAsDataURL(file); //읽고
			reader.onload = function(e){ //로드한 값을 표현한다
				console.log(e.target.result)
				$("#preview").attr("src",e.target.result) 
				//이렇게 하면 해당하는 위치에 이미지가 들어온다
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
	/* 	border: 1px solid; */
}
</style>
</head>
<body>
<c:import url="../default/header.jsp" />
<div class="content">
	<h3> M O D I F Y </h3> <br><hr style="background:#b3d7ff; height: 1px;"><br>	
	<div class="wrap">
	<div style="width:700px; text-align:left; margin: 0 auto;">
		<form action="${contextPath }/notice/modify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="notice_id" value="${personalData.noticeId }">
			<input type="hidden" name="originFileName" value="${personalData.noticeImageFileName }">
			<div class="form-group">
				<label for="witer">
				<b>Title</b>
				</label>
				<input class="form-control" type="text" size="30" name="notice_title" value="${personalData.noticeTitle }"><hr>
			</div>
			<div class="form-group">
				<label for="witer">
				<b>Content</b>
				</label>
				<textarea class="form-control" rows="10" cols="30" name="notice_content">${personalData.noticeContent}</textarea>
			<hr>
			<c:if test="${personalData.noticeImageFileName != 'nan' }">
				<img width="200px" height="200px" id="preview"
					src="${contextPath }/notice/download?noticeImageFileName=${personalData.noticeImageFileName}">
			</c:if>
			</div>
			<div class="custom-file">
				<input type="file" name="notice_image_file_name" onchange="readURL(this)" id="customFile">
				<label class="custom-file-label" for="customFile">Choose file</label>
			</div>
			<br><br><hr>
			<div class="form-group">
				<input class="form-control" type="submit" value="수정">
			</div>
			<hr>
			<input class="form-control" type="button" onclick="history.back()" value="돌아가기">
		</form>	
	</div>		
	</div>	
	</div>
	<c:import url="../default/footer.jsp" />

</body>
</html>