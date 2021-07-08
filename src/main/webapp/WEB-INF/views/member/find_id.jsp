<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
   margin: 0;
}

.content {
   display:flex; flex-flow:column;
   width:100%; margin:auto;
   text-align: center;
}


.content .aside{
	display:flex; 
	order: 1;
	margin:auto;
	width: 800px;
	margin-bottom:20px;
}


.aside .section{
	order:2;
	width: 60%;
	margin-left:100px;
	background: white;
}

ul li {
	display: flex;
}


.form{
	border: 1px solid  #00264d;
}
.form label {
	margin-top: 20px;
	height: 30px; width:140px;
	text-align: left;
}

.form input {
	font-size: 13px;
	height: 30px; width:250px;
	border: 1px solid #DEDEDE;
}


.content a{ color: grey; }
.content a:hover { color: black; }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="content">
	<div class="aside">
  	 <div class="section">
  	 	<br><br>
  	 	<form class="form" method="post">
	      <br><br><h3>아이디 찾기 검색 결과</h3><br>
	      <hr style="0; height: 2px; background: #00264d">
	      
	         
	           	<h5>아이디: <b>${id }</b></h5><br>
	           	<button type="button" style="width: 125px; height: 50px;" class="btn btn-outline-info" onclick="location.href='${contextPath }/member/login'">로그인</button><br>
	            <br>
	            </form>
         </div>
      </div>
 </div>
  <c:import url="../default/footer.jsp" />
	
</body>
</html>