<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function slideClick(){
		$("#first").slideDown("slow"); $("#modal_wrap").show();
	}
	function slide_hide(){
		$("#first").slideUp("fast"); $("#modal_wrap").hide();
	}
	function rep(){
		let form={}; let arr = $("#frm").serializeArray();
		for(i=0 ; i<arr.length ; i++){ form[arr[i].name] = arr[i].value }
		$.ajax({
			url: "addReply", type: "POST", data: JSON.stringify(form),
			contentType: "application/json; charset=utf-8",
			success: function(){
				alert("성공적으로 답글이 달렸습니다"); slide_hide();
				replyData();
			}, error: function(){
				alert("문제 발생!!!");
			}
		})
	}
	
	function replyData(){
		$.ajax({
			url:"replyData/"+${personalData.noticeId}, type:"GET", 
			dataType:"json",
			success: function(rep){
				let html = ""
				rep.forEach(function(data){
					let date = new Date(data.write_date)
					let writeDate = date.getFullYear()+"년"+(date.getMonth()+1)+"월"
					writeDate += date.getDate()+"일"+date.getHours()+"시"
					writeDate += date.getMinutes()+"분"+date.getSeconds()+"초"
					html += "<div align='left'><b>아이디 : </b>"+data.noticeId+"님 / ";
					html += "<b>작성일</b> : "+writeDate+"<br>"
					html += "<b>제목</b> : "+data.noticeTitle+"<br>"
					html += "<b>내용</b> : "+data.noticeContent+"<hr></div>"
				})
				$("#reply").html(html)
			},error:function(){
				alert('데이터를 가져올 수 없습니다')
			}
		})
	}
	
</script>

<style type="text/css">
#modal_wrap {
	display: none;
	position: fixed;
	z-index: 9;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.9);
}

* {
	margin: 0;
}

.content{
	display:flex; flex-flow:column;
	width:1200px; margin:auto;
	text-align: center;
/* 	border: 1px solid; */
}

#first {
	display: none;
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 100px;
	left: 0;
	right: 0;
	width: 600px;
	height: 600px;
	background-color: rgba(255, 255, 255, 0.9);
}
</style>
</head>
<body onload="replyData()">
	<c:import url="../default/header.jsp" />
	<div class="content">
	<h3>N O T I C E</h3><br>
	<div class="wrap">
		<table class="table table-bordered">
			<tr>
				<th style="background:#e6f2ff; ">No.1</th>
				<th colspan="3">${personalData.noticeId }</th>
			</tr>
			<tr>
				<th style="background:#e6f2ff; " >Writer</th>
				<th colspan="3">${personalData.noticeWriterId }</th>
			</tr>
			<tr>
				<th style="background:#e6f2ff; ">Writer Date</th>
				<th colspan="3">${personalData.noticeCreateDate }</th>
			</tr>
			<tr>
				<th style="background:#e6f2ff; ">Title</th>
				<th colspan="3">${personalData.noticeTitle }</th>
				
			</tr>
			<tr>
				<th colspan="4" style="background:#e6f2ff; ">Content</th>
			</tr>
			<tr>
				<th colspan="4">${personalData.noticeContent }</th>
			</tr>
			<tr>
				<th colspan="4"><c:if
						test="${personalData.noticeImageFileName == 'nan' }">
						<b>이미지가 없습니다</b>
					</c:if> <c:if test="${personalData.noticeImageFileName != 'nan' }">
						<img width="100%" height="100%"
							src="${contextPath }/notice/download?noticeImageFileName=${personalData.noticeImageFileName}">
					</c:if></th>
			</tr>

			<tr>
				<td colspan="4" align="center">
				<div id="reply"></div>
				<c:if test="${loginUser ==  personalData.noticeWriterId}">
						<input type="button" class="btn btn-outline-info" style="width: 20%;"
						onclick="location.href='${contextPath }/notice/modify_form?noticeId=${personalData.noticeId }'" value="수정">
						<input type="button" class="btn btn-outline-danger" style="width: 20%;" 
						onclick="location.href='${contextPath }/notice/delete?noticeId=${personalData.noticeId }&noticeImageFileName=${personalData.noticeImageFileName}'" value="삭제">
				</c:if> 
				<c:if test="${loginUser != null}">
					<input type="button" class="btn btn-outline-secondary" style="width: 20%;" onclick="slideClick()" value="답글달기">
				</c:if> 
				<input type="button" class="btn btn-outline-success" style="width: 20%;" onclick="location.href='${contextPath }/notice/noticeAllList'" value="목록"></td>
			</tr>
		</table>
	</div>
	<div id="modal_wrap">
		<div id="first">
			<div style="width: 400px; text-align:center; margin: 0 auto; padding-top: 20px;">
				<form id="frm">
					<input type="hidden" name="notice_id" value="${personalData.noticeId }">
					<h5><b> 답 글 작 성</b></h5><hr> 
					<b>I D &nbsp;&nbsp;&nbsp;</b>&nbsp; &nbsp;<input style="border:0.1px;  text-align: center;"  type="text" name="id" value=" ${loginUser }" readonly><hr>
					<b>TITLE</b>&nbsp; &nbsp;<input style="border:0.1px;"  type="text" id="title"  name="notice_title"><hr>
					<b>CONTENT</b><br> <textarea style="border:0.1px;"  rows="3" cols="50" id="content" name="notice_content"></textarea>
					<hr>
                        <button type="button" onclick="rep()" class="btn btn-outline-secondary" >답글</button>
                        <button type="button" onclick="slide_hide()" class="btn btn-outline-success">취소</button>
				</form>
			</div> 
		</div>
	</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>