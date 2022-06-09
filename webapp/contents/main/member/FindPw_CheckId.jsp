<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>이메일을 입력해주세요.</h1>
<form name="findPwCertForm" action="FindPw_CertEmail" method="post">
	<table>
		<tr>
    		<td>
    			개인회원<input type="radio" name="memberkind" value="개인회원"/>
    			법인회원<input type="radio" name="memberkind" value="법인회원"/>
    		</td>
   		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="pid" />
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="다음"/>
			</td>
		</tr>
	</table>
</form>