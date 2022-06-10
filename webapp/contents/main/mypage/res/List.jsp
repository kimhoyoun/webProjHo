<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <jsp:include page="../sideMenu.jsp"/>
<h1>대관 예약 정보</h1>

<c:set var = "type" value="gym"/>
<table border="">
	<tr>
		<th>종목</th>
		<th>신청일</th>
		<th>사용일</th>
		<th>장소</th>
		<th>가격</th>
		<th>상태</th>
	</tr>
	
	<c:forEach var="dto" items="${mainData }" varStatus="no">
		
	<tr>
		<td>
			<c:choose>
				<c:when test = "${fn:contains(dto.id, 'gym_basketball')}">
					<c:set var = "type" value="../../gym/basketball/Detail?id=${dto.id }"/>
					농구 경기장
				</c:when>
				<c:when test = "${fn:contains(dto.id, 'gym_soccor')}">
				<c:set var = "type" value="../../gym/soccor/Detail?id=${dto.id }"/>
					축구 경기장
				</c:when>
				<c:when test = "${fn:contains(dto.id, 'lesson_bas')}">
				<c:set var = "type" value="../../lesson/bas/Detail?id=${dto.id }"/>
					농구 레슨
				</c:when>
				<c:otherwise>
				<c:set var = "type" value="../../gym/soc/Detail?id=${dto.id }"/>
					축구 레슨
				</c:otherwise>
			</c:choose>
		</td>
		<td>
		<fmt:formatDate value="${dto.reg_date }" pattern="yy-MM-dd"/>
		</td>
		<td>
			${dto.resDate } <br />
			<c:forTokens items ="${dto.resTime }"
				delims = "," var = "time" varStatus="no">
				${time*2 }시~${(time+1)*2  }시 
			</c:forTokens>
		</td>
		<td><a href="<c:url value="${type }"/>">${dto.sname }</a></td>
		<td>${dto.amount }</td>
		<td>
			사용
		</td>
		<td>
			<button onclick="paymentCancelled('${dto.imp_uid}')">환불하기</button>
		</td>
	</tr>
	
	</c:forEach>
	<tr>
		<td colspan="5" align="center">
			<c:if test="${pageStart > 1 }">
				<a href="<c:url value="List?page=${pageStart-1 }"/>">[이전]</a>
			</c:if>
			<c:forEach var ="i" begin="${pageStart }" end="${pageEnd }" step="1">
				<c:choose>
					<c:when test="${nowPage == i }">
							[${i }]
					</c:when>		
					
					<c:otherwise>
					<a href="<c:url value="List?page=${i }"/>">${i }</a>
					</c:otherwise>		
				</c:choose>
				
				
				
			</c:forEach>
			
			<c:if test="${pageEnd<pageTotal }">
			<a href="<c:url value="List?page=${pageEnd+1 }"/>">[다음]</a>
			</c:if>
		</td>
	</tr>
</table>

<script>
	function paymentCancelled(uid){
		alert(uid+'환불페이지로 이동합니다.')
		location.href = "../../payment/Cancelled?imp_uid="+uid
	}
</script>