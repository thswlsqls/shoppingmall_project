function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
        	//도로 명일 경우 R, 지번일 경우 J의 값을 가지고 있다.
            console.log("data.userSelectedType :" +data.userSelectedType)
            console.log("data.roadAddress :" +data.roadAddress)
            console.log("data.jibunAddress :" +data.jibunAddress)
            console.log("data.zonecode(우편번호) :" +data.zonecode)
            addr = ""         
            if(data.userSelectedType == 'R'){
            	addr = data.rodeAddress
            }else{
            	addr = data.jibunAddress
            }
            $("#addr1").val(data.zonecode)
            $("#addr2").val(addr)
            $("#addr3").focus()
        }
    }).open();
   }