<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:include page="../sideMenu.jsp"/>
    
<form name="signUpForm" action="CorpMemberEdit_Reg" method="post">
	<table border="">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="pid" value="${user_data.pid }" readOnly/></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="nick_name" value="${user_data.nick_name }"/></td>
		</tr>
		<tr>
			<th>회사명</th>
			<td><input type="text" name="corp_name" value="${user_data.corp_name }"/></td>
		</tr>
		<tr>
			<th>사업자등록번호</th>
			<td><input type="text" name="corp_regnum" value="${user_data.corp_regnum }"/><button type="button" value="사업자 등록번호 확인" name="checkRegNum" onclick="corpRegNumCheck()">인증</button></td>
		</tr>
		<tr>
			<th>회사주소</th>
			<td><input type="text" name="corp_address" value="${user_data.corp_address }"/></td>
		</tr>
		<tr>
			<th>담당자이름</th>
			<td><input type="text" name="manager_name" value="${user_data.manager_name }"/></td>
		</tr>
		<tr>
			<th>담당자전화번호</th>
			<td><input type="text" name="manager_num" value="${user_data.manager_num }"/></td>
		</tr>
		<tr>
			<th>담당자이메일</th>
			<td>
				<input type="text" name="email1" id="inputEmailForm" value="${email }"/>
				<input type="text" style="width: 20px; border: none; background: transparent;" value="@" disabled /> 
				<select name="email2" id="selectEmailForm">
					<option value="gmail.com">google.com</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">naver.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" value="완료" /></td>
		</tr>
	</table>
</form>