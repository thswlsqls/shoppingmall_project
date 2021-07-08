<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> <!-- 외부파일 가져오는 경로 -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath }/resources/daumPost_js/daumpost.js"></script>
<script>

function register(){
    addr1 = $("#addr1").val()
     addr2 = $("#addr2").val()
     addr3 = $("#addr3").val()
     addr = addr1+"/"+addr2+"/"+addr3
     $("#addr1").val(addr)
     fo.submit()
}

/* function jbSubmit() {
    var pw1 = document.getElementById( 'pw1' ).value;
    var pw2 = document.getElementById( 'pw2' ).value;
    if ( pw != pw ) {
      alert( 'Confirm Password!' );
      return false;
    }
  } */

  function foo(){
       alert('회원정보 수정 완료');
   };
  
</script>


<style type="text/css">

* {
   margin: 0;
}

.content{
   display:flex; flex-flow:column;
   width:100%; margin:auto;
   text-align: center; color: #00264d;
}

.content .aside{
   display:flex; 
   order: 1;
   margin:auto;
   width: 1200px;
   margin-bottom:15px;
}

.aside .menu{
   order:1;
   width: 18%;
   padding-top: 140px;
}

.aside .section{
   order:2;
   width: 81%;
   margin-left:80px;
   border: 1px solid #f5f5f5;
}

ul li {
   display: flex;
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

#addr1{
   width: 143px;
}

.menu-nav { height: 120px; width:200px; background-color:white }
.p { border: 1px solid black;  padding-top: 8px; }
.content a{ color: grey; }
.content a:hover { color: #00264d; }

</style>
   
</head>
<body>
<c:import url="../default/header.jsp"/>
   <div class="content">
         
<!-- menu -->
      <div class="aside">
       <div class="menu">
        <ul>
          <li>
             <div class="menu-nav">
                  <a class="nav-link" href="${contextPath }/member/readOrders">
                     <div class="p">
                       <div class="p-2"><b>Order</b></div>
                       <div class="p-2">주문 조회</div>
                  </div> 
                  </a>             
              </div>
          </li>
          <li>
             <div class="menu-nav">
                  <a class="nav-link" href="${contextPath}/member/profile">
                     <div class="p">
                       <div class="p-2"><b>Profile</b></div>
                       <div class="p-2">회원 정보</div>
                  </div> 
                  </a>    
              </div>
          </li>
          <li>
             <div class="menu-nav">
                  <a class="nav-link" href="${contextPath }/member/readWishes">
                     <div class="p">
                       <div class="p-2"><b>Wishlist</b></div>
                       <div class="p-2">관심 상품</div>
                  </div> 
                  </a>   
              </div>
          </li>
          <li>
             <div class="menu-nav">
                  <a class="nav-link" href="${contextPath }/member/readMileage">
                     <div class="p">
                       <div class="p-2"><b>Mileage</b></div>
                       <div class="p-2">적립금</div>
                  </div> 
                  </a>    
              </div>
          </li>
          <li>
             <div class="menu-nav">
                  <a class="nav-link" href="#">
                     <div class="p">
                       <div class="p-2"><b>My board</b></div>
                       <div class="p-2">게시물 관리</div>
                  </div> 
                  </a>    
              </div>
          </li>
        </ul>
       </div>
      
<!-- 로그인 한 회원정보 수정-->
      <div class="section">
         <br><br>
         <h3>M O D I F Y　P R O F I L E</h3><br>
         <hr style="background: #00264d; height: 1px;">
         <br>      
         <form class="form" action="modify" method="post" onsubmit="foo();" >
         <label><b>ID</b></label> &nbsp; &nbsp; 
         <input style="background-color: #00264d; color: white;"  type="text" name="id" value="${memberList.memberId }" readonly><br>
         
         <label><b>Password</b></label> &nbsp; &nbsp; 
         <input type="password" name="pw" value="${memberList.memberPassword }" ><br>
                  
         <label><b>Password chk</b></label> &nbsp; &nbsp; 
         <input type="password" name="pw1" value="${memberList.memberPassword }" ><br>
         
         <label><b>Name</b></label> &nbsp; &nbsp;
         <input style="background-color: #00264d; color: white;" type="text" name="name" value="${memberList.memberName }" readonly><br>
         
         <label><b>Phone Number</b></label> &nbsp; &nbsp;
         <input type="text" name="phone" value="${memberList.memberPhone }"><br>
         
                  
         <label><b>E-mail</b></label> &nbsp; &nbsp; 
            <input name="email" type="text" value="${memberList.memberEmail }">
            <br> 
         
         <label style="width: 140px;"><b>Address</b></label> &nbsp; &nbsp;
            <input class="post" type="text" id="addr1" value="${memberList.memberAddress }" name="memberAddress" placeholder="우편번호"> 
            <input type="button" class="btn btn-outline-secondary" style="font-size: 9px; text-align: center; width: 100px; margin-bottom: 3px;" onclick="daumPost()" value="우편번호 검색"><br>
            <input style="margin-left: 165px;" type="text" id="addr2"  name="memberAddress2" value="${memberList.memberAddress2 }" placeholder="주 소"><br>
            <input style="margin-top: 10px; margin-left: 165px;" type="text" id="addr3" placeholder="상 세 주 소"><br>

         <label><b>Join Date</b></label> &nbsp; &nbsp;
         <input style="background-color: #00264d; color: white;" type="text" name="name" value="${memberList.memberCreateDate }" readonly><br>
            <br>         
         
           <br>
         <div class="form-button" >
            <input type="submit" id="modify" style="width: 125px; height: 50px;" class="btn btn-outline-info" value="회원정보 수정"> &nbsp; &nbsp;
            <input type="button"  style="width: 125px; height: 50px;" class="btn btn-outline-danger"  onclick="history.back()" value="취소"> &nbsp; &nbsp;
            <input type="button" id="delete" style="width: 125px; height: 50px;" class="btn btn-outline-secondary" onclick="location.href='${contextPath }/member/delete?memberId=${delete.userId }' " value="회원 탈퇴">
         <br><br><br>
         </div>   
         </form>      
      </div>
   </div>
   </div>
<c:import url="../default/footer.jsp"/>
</body>
</html>