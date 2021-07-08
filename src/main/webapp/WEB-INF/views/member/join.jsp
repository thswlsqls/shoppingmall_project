<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join.css"> -->
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
	width: 1200px;
	margin-bottom:15px;
}


.aside .section{
	order:2;
	width: 60%;
	margin-left:200px;
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


.title1 {
	text-align: center;
}

.pwd {
	font-size: 13px;
}

.success {
	font-size: 20px;
	width: 120px;
	padding: 4px;
	float: right;
}

.cancel {
	font-size: 20px;
	width: 60px;
	padding: 4px;
	float: left;
}

.id_input_re_1{
		color : green;
		display : none;
	}

.id_input_re_2{
		color : red;
		display : none;
	}
	


.mail_check_button{

	cursor: pointer;
	
	
}

.correct{
	color: green;
}
.incorrect{
	color: red;
}

.clearfix{
	clear: both;
}

.final_name_ck{
	display: none;
}
.final_id_ck{
	display: none;
}

.final_pw_ck{
	display: none;
}

.final_pwd_ck{
	display: none;
}
.final_ph_ck{
	display: none;
}
.final_mail_ck{
	display: none;
}

.final_addr_ck{
	display: none;
}

.pwd_input_re_1{
	color: green;
	display: none;
}

.pwd_input_re_2{
	color: red;
	display: none;
}

#addr1{
	width: 143px;
}

#mail1{
	width: 143px;
}


input{} input:read-only{background-color:#dedede} /* read-only style */ select{padding:7px; vertical-align:middle}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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




</script>


</head>
<body>
	<!-- 헤더 -->
	<c:import url="../default/header.jsp" />
	<!-- 본문 -->
	<div class="content">
		<div class="aside">
			<div class="section">
				<!-- <form id="fo" action="register" method="post"> -->
				<form class = "form" id="fo" method="post">
					<br><h3>회 원 가 입</h3>
					<hr style="0; height: 2px; background: #00264d">
					<br>
						<div>
							<label><b>이름</b></label> &nbsp; &nbsp; 
							<input class="user_input" type="text" name="memberName"><br>
							<span class="final_name_ck">이름을 입력하세요</span>
						</div>
						<div class="id_wrap">
							<label><b>아이디</b> </label>&nbsp; &nbsp; 
							<input class="id_input" type="text" name="memberId"><br>
							<span class="id_input_re_1"  style="padding-left: 100px">사용 가능한 아이디 입니다.</span>
							<span class="id_input_re_2"  style="padding-left: 50px">중복 아이디 입니다.</span>
							<span class="final_id_ck"  style="padding-left: 150px">아이디를 입력하세요</span>
						</div>
						<!-- <input type="checkbox" name="chkId" value="chkId">중복확인<br> --> 
						<div class="pw_wrap">
							<label><b>비밀번호</b></label> &nbsp; &nbsp; 
							<input class = "pw_input"  type="password" name="memberPassword"><br>
							<span class="final_pw_ck">비밀번호를 입력하세요</span>
						</div>
						<div>
							<label><b>비밀번호 확인</b></label>&nbsp; &nbsp; 
							<input class = "pwd_input" type="password"><br>
							<span class="final_pwd_ck"  style="padding-left: 150px">비밀번호 확인을 해주세요</span>
							<span class = "pwd_input_re_1"  style="padding-left: 80px">비밀번호가 일치합니다</span>
							<span class = "pwd_input_re_2"  style="padding-left: 120px">비밀번호가 일치하지 않습니다</span>
						</div>
						<div class="ph_wrap">
							<label><b>휴대전화</b></label>&nbsp; &nbsp; 
							<input class="ph_input" type="text" name="memberPhone">
							<span class="final_ph_ck">전화번호를 입력하세요</span>
						</div>
						<div class = "mail_wrap" >
							<label><b>이메일</b></label>&nbsp; &nbsp; 
							<input class ="mail_input" type="text" name="memberEmail">
							<span class="final_mail_ck">이메일을 입력해주세요</span>
							
							<div class="mail_check_wrap">
								<div class="mail_check_input_box" id = "mail_check_input_box_false">
									<input style="margin-left: 160px;" class = "mail_check_input" id = "mail1" type="text" disabled="disabled">
									<input type="button" class="mail_check_button btn btn-outline-secondary" style="font-size: 9px; text-align: center; width: 100px; margin-bottom: 3px;"value="메일 보내기">	
								</div>
								<span class="mail_input_box_warn" style="padding-left: 150px"></span>
								<br>
								<input type="button" style="width: 100px; height: 30px; margin-left: 10px;" class="btn btn-outline-secondary"  value="확인">
								<span id = "mail_check_input_box_warn"  style="padding-left: 10px"></span>
								
									
								<div class="clearfix"></div>
								
							</div>
						</div>
						
						<div>
					<label style="width: 140px"><b>주소</b></label>&nbsp; &nbsp; 
						<input size="15" type="text" id="addr1" name="memberAddress" placeholder="우편번호">
						<input type="button"  class="btn btn-outline-secondary" style="font-size: 9px; text-align: center; width: 100px; margin-bottom: 3px;" onclick="daumPost()" value="우편번호 검색"><br>
						<input style="margin-left: 165px;" type="text" id="addr2" name="memberAddress2" placeholder="주 소"><br>
						<input style="margin-top: 10px; margin-left: 165px;" class="address_input" type="text" id="addr3" placeholder="상 세 주 소"><br>
						<span class="final_addr_ck">주소를 입력하세요</span>
						</div>
						<br>
						<button type="button" style="width: 125px; height: 50px;" class="btn btn-outline-danger"  onclick="location.href='${contextPath }/member/login' ">취소</button>
						<input type="button" style="width: 125px; height: 50px;" class="btn btn-outline-info join_button"onclick="register()" value="회원가입"><br><br>
					

			</form>
		</div>
	</div>
</div>
<script>

var code = "";

var idCheck = false;
var idckCheck = false;
var pwCheck = false;
var pwckCheck = false;
var pwckcorCheck = false;
var nameCheck = false;
var mailCheck = false;
var mailnumCheck = false;
var addressCheck = false;
var phonecheck = false;

$(document).ready(function(){
	$(".join_button").click(function(){
		var id = $('.id_input').val();
		var pw = $('.pw_input').val();
		var pwd = $('.pwd_input').val();
		var name = $('.user_input').val();
		var mail = $('mail_input').val();
		var addr = $('address_input').val();
		var ph = $('.ph_input').val();
		
		if(id == ""){
			$('.final_id_ck').css("display","block");
            idCheck = false;
		} else{
			$('.final_id_ck').css("display", "none");
			idCheck = true;
		}
		
		if(pw== ""){
			$('.fianl_pw_ck').css('display', 'block');
			pwCheck = false;
		} else{
			$('.final_pw_ck').css('display', 'none');
			pwCheck = true;
		}
		
		if(pwd == ""){
			$('.final_pwd_ck').css('display', 'block');
			pwckCheck = false;
		} else{
			$('.final_pwd_ck').css('display', 'none');
			pwckCheck = true;
		}
		
		if(name == ""){
			$('.final_name_ck').css('display', 'block');
			nameCheck = false;
		} else{
			$('.final_name_ck').css('display', 'none');
			nameCheck = true;
		}
		
		if(mail == ""){
            $('.final_mail_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }
		
		if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }
		
		if(ph == ""){
			$('.final_ph_ck').css("display","block");
			phonecheck = false;
		} else{
			$('.final_ph_ck').css("display", "none");
			phonecheck = true;
		}

		if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&addressCheck&& phonecheck ){
			$("#fo").attr("action", "register");
			$("#fo").submit();
        } else{
        	alert("회원 가입에 실패했습니다, 다시 가입해주세요")
        	location.reload();
        }    
 		
		

		//$("#fo").attr("action", "register");
		//$("#fo").submit();
	});
});

$('.id_input').on("propertychange change keyup paste input", function(){
	var memberId = $('.id_input').val();
	var data = {memberId : memberId}
	
	$.ajax({
		type: "post",
		url: "memberIdChk",
		data: data,
		success: function(result){
			if(result != 'fail'){
				$('.id_input_re_1').css("display", "inline-block");
				$('.id_input_re_2').css("display", "none");
				idckCheck=true;
			} else{
				$('.id_input_re_2').css("display", "inline-block");
				$('.id_input_re_1').css("display", "none");
				idckCheck=false;
			}
		}
	});
});

$(".mail_check_button").click(function(){
	var memberEmail = $(".mail_input").val();
	var checkBox = $(".mail_check_input");
	var boxWrap = $(".mail_check_input_box");
	var warnMsg = $(".mail_input_box_warn");
	
	
	if(mailFormCheck(memberEmail)){
        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
    } else {
        warnMsg.html("올바르지 못한 이메일 형식입니다.");
        warnMsg.css("display", "inline-block");
        return false;
    }    
 


	$.ajax({
		type: "GET",
		url: "mailCheck?email= " + memberEmail,
		success: function(data){
			checkBox.attr("disabled", false);
			boxWrap.attr("id", "mail_check_input_box_true");
			code = data;
		}
	});
});

$(".mail_check_input").blur(function(){
	var inputCode = $(".mail_check_input").val();
	var checkResult = $("#mail_check_input_box_warn");
	
	if(inputCode == code){
		checkResult.html("인증번호 일치");
		checkResult.attr("class", "correct");
		mailnumCheck = true; 
	} else{
		checkResult.html("인증번호 불일치");
		checkResult.attr("class", "incorrect");
		mailnumCheck = false;
	}
});

$('.pwd_input').on("propertychange change keyup paste input", function(){
	var pw = $('.pw_input').val();
	var pwd = $('.pwd_input').val();
	$('.fianl_pwd_ck').css('display', 'none');
	
	if(pw == pwd){
        $('.pwd_input_re_1').css('display','block');
        $('.pwd_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwd_input_re_1').css('display','none');
        $('.pwd_input_re_2').css('display','block');
        pwckcorCheck = false;
    }        

});

 function mailFormCheck(memberEmail){
	 var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	 return form.test(memberEmail);
 }
</script>
	<!-- 푸터 -->
	<c:import url="../default/footer.jsp" />
</body>
</html>





