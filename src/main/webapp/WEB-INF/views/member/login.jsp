<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>

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

.login_warn{
	margin-top: 30px;
	text-align: center;
	color: red;
}

.content a{ color: grey; }
.content a:hover { color: black; }



</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath }/resources/daumPost_js/daumpost.js"></script>
<script type="text/javascript">
const result="${msg}"
	if(result == "fail"){
		alert('아이디나 비밀번호가 일치하지 않습니다');
	}
</script>
</head>
<body>
<c:import url="../default/header.jsp" />
<div class="content">
	<div class="aside">
  	 <div class="section">
  	 	<br><br>
  	 	<form class="form" action="${contextPath }/member/user_check" method="post">
	      <br><br><h3>L O G I N</h3><br>
	      <hr style="0; height: 2px; background: #00264d">
	      
	           
	               <label><b>ID</b></label>&nbsp; &nbsp;
	               <input type="text" name="memberId" placeholder="id"><br>
	               <label><b>Password</b></label>&nbsp; &nbsp;
	               <input type="password" name="memberPassword" placeholder="password"><br>
	               <br>
	               
	               <input type="submit" style="width: 125px; height: 50px;" class="btn btn-outline-info" value="로그인"><br><br>
	               <a href="${contextPath }/member/find_id_form.do">아이디찾기/</a>
	               <a href="${contextPath }/member/find_pw_form.do">비밀번호찾기/</a>
	               <a href="${contextPath }/member/register_form">회원가입</a>
	               <br><br>
	            </form>
         </div>
      </div>
 </div>
   <c:import url="../default/footer.jsp" />
</body>
</html>