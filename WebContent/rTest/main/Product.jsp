<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>상품 정보</h1>

<form action="Reservation" >
<input type="hidden" name="pname" value="apple" />
<input type="hidden" name="price" value="100" />
<table>

	<tr>
		<th>이름</th>
		<td>사과</td>
	</tr>
	<tr>
		<th>가격</th>
		
		<td>100원</td>
		
	</tr>
	<tr>
	<td colspan = "2">
		<input type="submit" value="예약" />
	</td>
	</tr>
</table>
</form>


