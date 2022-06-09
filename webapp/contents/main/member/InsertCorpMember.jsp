<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="signUpForm" action="CorpInsertReg" method="post">
	<table border="">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="pid"/></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="pw"/></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="nick_name"/></td>
		</tr>
		<tr>
			<th>회사명</th>
			<td><input type="text" name="corp_name"/></td>
		</tr>
		<tr>
			<th>사업자등록번호</th>
			<td><input type="text" name="corp_regnum"/><button type="button" value="사업자 등록번호 확인" name="checkRegNum" onclick="corpRegNumCheck()">인증</button></td>
		</tr>
		<tr>
			<th>회사주소</th>
			<td><input type="text" name="corp_address"/></td>
		</tr>
		<tr>
			<th>담당자이름</th>
			<td><input type="text" name="manager_name"/></td>
		</tr>
		<tr>
			<th>담당자전화번호</th>
			<td><input type="text" name="manager_num"/></td>
		</tr>
		<tr>
			<th>담당자이메일</th>
			<td>
				<input type="text" name="email1" id="inputEmailForm"/>
				<input type="text" style="width: 20px; border: none; background: transparent;" value="@" disabled /> 
				<select name="email2" id="selectEmailForm">
					<option value="gmail.com">google.com</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">naver.com</option>
				</select>
				<button onclick="emailAuthentication()" id="eamilAuthBtn" 
						type="button" class="btnChk">인증 메일 보내기</button>
			</td>
		</tr>
		<tr>
			<th>인증번호 입력</th>
			<td colspan="2">
			<input type="text" name="authCode" id="inputAuthCode" maxlength="10">
			<button onclick="authCodeCheck()" id="authCodeCheckBtn" type="button">인증</button> 
			<input type="hidden" name="authPass" id="authPass" value="false"></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" value="완료" /></td>
		</tr>
	</table>
</form>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	var corpCheck = false;
	
	function emailAuthentication(){
		if (!emailValCheck()){
	    	return false;
	    }
		var email = document.signUpForm.corp_email.value;

		var userData =  new Object();
	        	  userData.email = email;
	        	  userData.requestPage = "InsertCorpMember";
		$.ajax({
			url:'/member/Cert/MailReg',
			data:userData,
			type:'POST',
			success: function(result){
				console.log(userData)
			},
			error:function(e){
				console.log(e);
			}
	  })
	}

	function emailValCheck(){
		var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = document.signUpForm.corp_email.value;
		if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
			return false;
		}
	    return true;
	}


	function check(pattern, taget, message) {
		if(pattern.test(taget)) {
	    	return true;
	    }
	    alert(message);
	    taget.focus();
	    return false;
	}

	function authCodeCheck(){
		var url = "/member/Cert/authCodeCheck?inputedCode=" + document.signUpForm.authCode.value;
		open(url, "confirm",
				"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	}	

function corpRegNumCheck(){
    var inputRegNum = document.signUpForm.corp_regnum.value;
   //  console.log(inputRegNum);

    var data = {
    "b_no": [inputRegNum]
    }; 
    
    console.log(data)

    $.ajax({
      url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=TSCYgkMUJNavMzzHkbBTAvLHLaj1RrxOpBZ6BGHm49jIZIs%2FWtYi41K96uUEnIDmbtL7F7x900D14CVoDKpsNA%3D%3D",  // serviceKey 값을 xxxxxx에 입력
      type: "POST",
      data: JSON.stringify(data), // json 을 string으로 변환하여 전송
      dataType: "JSON",
      contentType: "application/json",
      accept: "application/json",
      success: function(result) {
    	  var b_stt = result.data[0].b_stt;
    	  
    	  if(b_stt=="" || b_stt=="폐업자" || b_stt=="휴업자"){
    		  alert("잘못된 등록번호 입니다.")
    	  }else if(b_stt=="계속사업자"){
    		  alert("인증되었습니다.")
    		  corpCheck = true;
    	  }else{
    		  alert("잘못된 등록번호 입니다.")
    	  }
    	  console.log(result)
          
      },
      error: function(result) {
          console.log(result.responseText); //responseText의 에러메세지 확인
      }
    });
 }
</script>