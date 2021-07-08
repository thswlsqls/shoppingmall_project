<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css">
* {
   margin: 0;
}

.wrap {
   width: 1000px;
   margin: auto;
   text-align: center;
   
}

.header {
   width: 1000px;
   background-color: white;
}
.header img {
   width: 50%;
   align-content:center;
   margin-top: 10px;
   margin-bottom: 20px;
}

.navdiv {
   width: 100%;
   background-color: #00264d;
}

nav {
   background-color: #00264d;
   width: 1000px;
}

nav ul {
   list-style: none;
   display: flex;
   justify-content: flex-end;
}

nav ul.nav-left {
   float: left;
}

nav ul li {
   margin: 0 3px;
   padding: 10px 10px;
}

nav ul li a {
   text-decoration: none;
   color: white;
}

nav ul li a:hover {
   color: orange;
   padding-bottom: 3px; /* a태그 밑줄과 글씨 간격*/
   border-bottom: 1px solid orange;
   transition: all 0.25s;
}

.title { /*오른, 아래, 번짐*/
   text-shadow: 10px 10px 15px black;
   font-size: 70pt;
   text-align: center;
   margin-top: 20px;
   padding-bottom: 20px;
   color: black;
   font-family: Gabriola;
}


a:link {color: wite; text-decoration: none; }
a:visitec {clolr: black; text-decoration: none;}
a:hover {color: black; text-decroation: none;}
a:active { color: black;}

.content {
   margin-top: 50px;
}
</style>
</head>
<body>
   <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
   <div class="wrap">
      <div class="header">
         <a href="${contextPath}/index">
         <img class="logo" src="${pageContext.request.contextPath}/resources/img/mainlogo1.jpg" width="50%" >
         </a>
      </div>
   </div>
   <div class="navdiv">
      <div class="wrap">
         <nav>
               <ul class="nav-left">
                  <li><a href="${contextPath}/index">HOME</a></li>
                  <li><a href="${contextPath}/product/allview">ALL</a></li>
               </ul>
               <ul>
               <li><a href="${contextPath}/mypage/mypage">MYPAGE</a></li>
               <li>
               <c:choose>
                     <c:when test="${loginUser == null}">
                        <a href="${contextPath}/member/login">CART</a >
                     </c:when>
                     <c:otherwise>
                        <a href="${contextPath}/mypage/cart">CART</a>
                     </c:otherwise>
                  </c:choose>
               </li>
               <li><a href="${contextPath}/notice/noticeAllList">NOTICE</a></li>

               <%-- <li>
               <a href="${contextPath}/member/memberInfo">MEMBER-SHIP</a>
               </li> --%> 
               <li>
                  <c:choose>
                     <c:when test="${loginUser == null}">
                        <a href="${contextPath}/member/login">LOGIN</a>
                     </c:when>
                     <c:otherwise>
                        <a href="${contextPath}/member/logout">LOGOUT</a>
                     </c:otherwise>
                     </c:choose>
                  </li>
                  <li><img src="${pageContext.request.contextPath}/resources/img/search (2).png" width="30px" height="25px"></li>   
            </ul>
         </nav>
      </div>
   </div>
</body>
</html>