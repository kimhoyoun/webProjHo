<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>수정하실 정보를 입력 해주세요</h2>

<jsp:include page="../sideMenu.jsp"/>


<form action="MemberEdit_Reg" method="post">
	<table border="">
		<tr>
			<th>ID</th>
			<td>
				<input type="text" name="pid" value="${user_data.pid }" readOnly />
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pw" value="${user_data.pw }" readOnly />
			</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="nick_name"
				value="${user_data.nick_name }" /></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="pname" value="${user_data.pName }" /></td>
		</tr>
		<tr>
			<th>성별</th>
			<!-- 자바스크립트로 이전 선택값을 비교하여 선택 되어 있도록 해야함 -->
			<td>
				남자<input type="radio" name="gender" value="남자"  <c:if test="${user_data.gender == \"남자\"}">checked</c:if>  />
			 	여자<input	type="radio" name="gender" value="여자" <c:if test="${user_data.gender == \"여자\"}">checked</c:if>  />
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><select name="telecom" class="select_box">
					<option>이동통신</option>
					<option value = "SKT" <c:if test="${user_data.telecom == \"SKT\"}">selected</c:if>>SKT</option>
					<option value = "KT" <c:if test="${user_data.telecom == \"KT\"}">selected</c:if>>KT</option>
					<option value = "LGU+" <c:if test="${user_data.telecom == \"LGU+\"}">selected</c:if>>LGU+</option>
			</select> <input type="text" name="phonenum" maxlength="11" value="${user_data.phoneNum }"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email1" id="inputEmailForm"
				maxlength="30" value="${email }"> <input type="text"
				style="width: 20px; border: none; background: transparent;"
				value="@" disabled /> <select name="email2" id="selectEmailForm">
					<option value="gmail.com">google.com</option>
					<option value="naver.com">naver.com</option>
					<option value="naver.com">nate.com</option>
			</select>
		</tr>
		<tr>
			<th>주소</th>
			<td>
			<input type="text" name="postcode" id="postcode" placeholder="우편번호">
   			<input type="button" onclick="on()" value="우편번호 찾기"><br>
		    <input type="text" name="address" id="address" value="${user_data.address }" placeholder="주소"><br>
		    <input type="text" name="detailAddress" id="detailAddress" value="${user_data.detailAddress }" placeholder="상세주소">
		    <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
		    </td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="완료" />
			</td>
		</tr>
	</table>
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
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
</script>

