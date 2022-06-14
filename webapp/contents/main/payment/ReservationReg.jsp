<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<h1>결제 완료</h1>

<table>
	<tr>
		<td>주문번호</td>
		<td>${paymentResult.imp_uid }</td>
	</tr>
	<tr>
		<td>결제 금액</td>
		<td>${paymentResult.amount }</td>
	</tr>
	<tr>
		<td>결제자</td>
		<td>${paymentResult.buyer_name }</td>
	</tr>
	<tr>
		<td>상품 번호</td>
		<td>${paymentResult.merchant_uid }</td>
	</tr>
	<tr>
		<td>경기장 이름</td>
		<td>${paymentResult.sname }</td>
	</tr>
	<tr>
		<td>예약 날짜</td>
		<td>${paymentResult.resDate }</td>
	</tr>
	<tr>
		<td>예약 시간</td>
		<td>
		<c:choose>
			<c:when test="${fn:contains(paymentResult.resTime, ',')}">
				<c:forTokens items ="${paymentResult.resTime }"	delims = "," var = "time" varStatus="no">
				${time*2 }시~${(time+1)*2  }시 
				</c:forTokens>
			</c:when>
			<c:otherwise>
				${paymentResult.resTime }
			</c:otherwise>
		</c:choose>
		
		</td>
	</tr>
	<tr>
		<td>유저 아이디</td>
		<td>${paymentResult.user_id }</td>
	</tr>
	
</table>
<a href="List">목록으로</a>