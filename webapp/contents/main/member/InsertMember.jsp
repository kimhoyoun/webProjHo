<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form name="signUpForm" action="InsertReg" method="post" onsubmit="return authCheck();">
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
			<td>
			<input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly>
   			<input type="button" onclick="on()" value="우편번호 찾기"><br>
		    <input type="text" name="address" id="address" placeholder="주소" readonly><br>
		    <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
		    <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목" readonly>
		    </td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" name="완료" />
			</td>

		</tr>
	</table>
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
const form = document.signUpForm;
var requrl = '<c:url value="/cert/MailReg"/>'

function on(){
	execDaumPostcode();
	
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	}
}

function authCheck(){	/* 인증 유효성검사 */
	var reg= document.getElementById("authPass").value;
	
	if(reg=="true"){
		return true
	} else if(reg=="false"){
		alert("이메일 인증을 해주세요")
		return false;
	}
}


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