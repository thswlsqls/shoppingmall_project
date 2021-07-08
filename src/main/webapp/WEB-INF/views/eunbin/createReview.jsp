<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib  uri="http://www.springframework.org/tags" prefix="tags" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
* { margin: 0; }
.content { display:flex; justify-content: center; flex-direction: row;
			width:1200px; margin:auto; border: 1px solid #f5f5f5; color:#00264d; }

/* .content ::-webkit-scrollbar-track
	{ -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 5px; background-color: #F5F5F5; }
.content ::-webkit-scrollbar { width: 20px; background-color: #F5F5F5; }
.content ::-webkit-scrollbar-thumb { border-radius: 10px; 
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.5); background-color: #cce6ff; } */
			
	.margin20px {margin :20px;}
	.margin10px {margin: 10px;}
	.directionRow{flex-direction: row;}
	.alignCenter{align-items: center;}
	.alignItemsFlexStart{align-items: flex-start;}

	.minHeight234px{min-height: 234px;}
	.maxHeight234px{max-height: 234px;}
	.minWidth300px{min-width: 300px;}
	
	.justifyContentCenter{justify-content: center;}

	.marginLeft40px{margin-left: 40px;}
	.marginTop100px{margin-top:100px;}
	
</style>
<body >
	<c:import url="../default/header.jsp"/>
		<div class="content">
			<div style="height:90%;" class="d-flex flex-column"><br><br>  
				<h3 style=" text-align: center;" ><b>상품후기 작성</b></h3>	<br><hr style="color: #005cb3;">
				
	  		<form action="${contextPath }/member/saveReview" method="post" enctype="multipart/form-data">				
			  <div style="height:90%; /* overflow-y:scroll; */ " class="d-flex flex-column">	 
				  	<div class="d-flex p-3">
				  		<span style="padding-left:10px; margin-bottom: 10px; margin: 10px;"><b>제목</b></span>
				  		<input type="text" name="title" style="width:500px; padding-left:10px;" placeholder="제목을 입력해주세요" class="form-control">
					</div>
			
			  <div class="p-2">
				      <div class="d-flex p-3  text-white alignItemsFlexStart">
						  <div style="position:relative; color:black; width:50%;" class="p-2 ">
						  	<div style="height:100%;">
					  			<img class="card-img-top minWidth300px maxHeight234px" src="<tags:url value='/resources/img/${orderProductName}.jpg'/>" alt="Card image">
					  		</div>
					      </div>
						  <div style="margin-top:10px; position:relative; color:black; width: 50%;" class="p-2  marginLeft40px">
						     <div class="d-flex flex-column">
							  <div class="p-2"><b>상품명 : </b>&nbsp; ${orderProductName}</div>
							  <div class="marginTop100px p-2">
							  	<b>상품평</b>  
							  	<select name="score" style="float:right; width:100px; margin-right: 10px; " class="form-select" aria-label="Default select example">
								  	<optgroup style="margin-bottom: 5px;" label="평점">
									  <option selected value="5">5</option>
									  <option value="4">4</option>
									  <option value="3">3</option>
									  <option value="2">2</option>
									  <option value="1">1</option>
									  </optgroup>
								</select>
							  </div>
							</div>
						  </div>
						  
  						  <div style="display:flex; flex-direction:column; margin-top:10px; height:220px; position:relative; color:black;  justify-content: space-between; width: 50%;" class="p-2  marginLeft40px">	  	
							<div class="form-check margin10px">
							  <input class="form-check-input" type="radio" name="degree"  value="좋아요"  id="flexRadioDefault1" checked>
							  <label class="form-check-label" for="flexRadioDefault1">
							    좋아요
							  </label>
							</div>
							<div class="form-check margin10px">
							  <input class="form-check-input" type="radio" name="degree"  value="보통이예요"  id="flexRadioDefault2" >
							  <label class="form-check-label" for="flexRadioDefault2">
							    보통이예요
							  </label>
							</div>
							<div class="form-check margin10px">
							  <input class="form-check-input" type="radio" name="degree"  value="나빠요" id="flexRadioDefault3" >
							  <label class="form-check-label" for="flexRadioDefault3">
							    나빠요
							  </label>
							</div>	
  						  </div>
  						  
					  </div>
				  </div>
				  
				  <div class="p-2 ">
				  	<div class="form-group" style="width: 95%; margin-left: 25px;">
		  	  			<label for="content">
							<b>상세 리뷰</b><br>
						</label>
					  <textarea class="form-control"  name="content" rows="8" 
					  id="comment" placeholder="리뷰를 작성해주세요" 
					  style="color: gray; width:100%; "></textarea>
					</div>
				  </div>
				  
				  <div class="p-2 ">
					<div class="custom-file" style="width: 95%; margin-left: 25px;">
						<input style="width: 500px; margin-right: 80px;" type="file" name="image_file_name" onchange="readURL(this)" id="customFile">
						<label style="width: 500px;"  class="custom-file-label" for="customFile">사진 첨부</label>
						
						<img id="preview" class="margin10px" src="#" width="100" alt="x">
						<!-- 
						<img id="preview1" class="margin10px" src="#" width="80" height="80" alt="x">
						<img id="preview2" class="margin10px" src="#" width="80" height="80" alt="x">
	  					<img id="preview3" class="margin10px" src="#" width="80" height="80" alt="x">
	  					<img id="preview4" class="margin10px" src="#" width="80" height="80" alt="x"> 
	  					 -->
					</div> 
				  </div>
				  
				  <div class="p-2 ">
				  	<hr style="border: 1px solid #005cb3;">
				  	<div class="d-flex p-3  text-white alignCenter justifyContentCenter">
					  <button type="submit" class="btn btn-outline-info margin20px" style="width: 300px;" value="상품평쓰기">등록</button>
					  <button type="button" class="btn btn-outline-secondary  margin20px" style="width: 300px;" onclick="location.href='${pageContext.request.contextPath}/member/readOrders'">취소</button>
					</div>
				  </div>
			   </div>
			   </form>
			   
			</div>
 		</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>