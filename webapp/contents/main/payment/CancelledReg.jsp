<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>환불띠</h1>

<h3>${msg }</h3>

<table>
	<tr>
		<td>주문번호</td>
		<td>${data.imp_uid }</td>
	</tr>
	<tr>
		<td>결제 금액</td>
		<td>${data.amount }</td>
	</tr>
	<tr>
		<td>결제자</td>
		<td>${data.buyer_name }</td>
	</tr>
	<tr>
		<td>상품 번호</td>
		<td>${data.merchant_uid }</td>
	</tr>
	<tr>
		<td>경기장 이름</td>
		<td>${data.sname }</td>
	</tr>
	<tr>
		<td>예약 날짜</td>
		<td>${data.resDate }</td>
	</tr>
	<tr>
		<td>예약 시간</td>
		<td>
		<c:forTokens items ="${data.resTime }"	delims = "," var = "time" varStatus="no">
				${time*2 }시~${(time+1)*2  }시 
		</c:forTokens>
		</td>
	</tr>
	<tr>
		<td>유저 아이디</td>
		<td>${data.user_id }</td>
	</tr>
	<tr>
		<td>환불 상태</td>
		<td>${data.refund_reg }</td>
	</tr>
	
</table>
<a href="List">목록으로</a>