<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form action="PwChange" method="post">
	<table border="">
		<tr>
			<th>새로운 비밀번호 입력</th>
			<td><input type="text" name="pw" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="완료" />
				<input type="hidden" name="email" value="${email }"/>
				<input type="hidden" name="memberkind" value="${memberkind }"/>
			</td>
		</tr>
	</table>
</form>