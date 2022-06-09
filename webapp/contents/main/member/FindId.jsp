<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>이메일을 입력해주세요.</h1>
<form name="findIdForm" action="FindIdReg" method="post">
	<table>
		<tr>
    		<td>
    			개인회원<input type="radio" name="memberkind" value="개인회원" checked/>
    			법인회원<input type="radio" name="memberkind" value="법인회원"/>
    		</td>
   		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email" id="inputEmailForm"/>
				<button onclick="emailAuthentication()" id="eamilAuthBtn"
					type="button">인증 메일 보내기</button>
			</td>
			
		</tr>
		<tr>
			<th>인증번호 입력</th>
			<td colspan="2">
				<input type="text" name="authCode" id="inputAuthCode" maxlength="10">
				<button onclick="authCodeCheck()" id="authCodeCheckBtn" type="button" class="btnChk">인증</button> 
				<input type="hidden" name="authPass" id="authPass" value="false">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="아이디 확인하기"/>
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>

function emailAuthentication(){
	
	var requrl = '<c:url value="/cert/MailReg"/>'
	
  	var email = document.findIdForm.email.value;
  	var memberkind = document.findIdForm.memberkind.value;
    // console.log(email)
	var userData =  new Object();
        	  userData.email = email;
        	  userData.memberkind = memberkind;
        	  userData.requestPage = "FindId";
	$.ajax({
		url: requrl,
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

function authCodeCheck(){
	var url = '<c:url value="/cert/authCodeCheck"/>?inputedCode=' + document.findIdForm.authCode.value;
	open(url, "confirm",
			"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
}
</script>