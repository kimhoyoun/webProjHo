<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form name="signUpForm" action="InsertReg" method="post">
	<table border="">
		<tr>
			<th>ID</th>
			<td><input type="text" name="pid"/></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="password" name="pw" /></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="nick_name"/></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="pname" /></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>남자<input type="radio" name="gender" value="남자" /> 여자<input
				type="radio" name="gender" value="여자" />
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><select name="telecom" class="select_box">
					<option>이동통신</option>
					<option>SKT</option>
					<option>KT</option>
					<option>LGU+</option>
			</select> <input type="text" name="phonenum1" maxlength="3" /> - <input
				type="text" name="phonenum2" maxlength="4" /> - <input type="text"
				name="phonenum3" maxlength="4" /></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email1" id="inputEmailForm" maxlength="30"> 
				<input type="text" style="width: 20px; border: none; background: transparent;" value="@" disabled /> 
				<select name="email2" id="selectEmailForm">
					<option value="gmail.com">google.com</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">naver.com</option>
				</select>
				<button onclick="emailAuthentication()" id="eamilAuthBtn"
					type="button">인증 메일 보내기</button>
			</td>
		</tr>
		<tr>
			<th>인증번호 입력</th>
			<td colspan="2">
			<input type="text" name="authCode" id="inputAuthCode" maxlength="10">
			<button onclick="authCodeCheck()" id="authCodeCheckBtn" type="button" class="btnChk">인증</button> 
			<input type="hidden" name="authPass" id="authPass" value="false"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" /></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" name="완료" />
			</td>

		</tr>
	</table>
</form>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
const form = document.signUpForm;

var requrl = '<c:url value="/cert/MailReg"/>'

function emailAuthentication(){
	if (!emailValCheck()){
    	return false;
    }

  	var email = form.email1.value + "@" +form.email2.value;
    // console.log(email)
	var userData =  new Object();
        	  userData.email = email;
        	  userData.requestPage = "InsertMember";
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

function emailValCheck(){
	var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email = form.email1.value + "@" +form.email2.value;
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
	
	var url = '<c:url value="/cert/authCodeCheck"/>?inputedCode=' + document.signUpForm.authCode.value;
	open(url, "confirm",
			"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
}

</script>