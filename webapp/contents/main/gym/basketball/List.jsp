<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>농구 대관페이지</h1>

<table> 

	<tr>
		<th>이미지</th>
		<th>제목</th>
		<th>매니저</th>
		<th>작성일</th>
		
	</tr>
	<c:forEach var="dto" items="${mainData }" varStatus="no">
		
	<tr>
		<td><img src="<c:url value="/uploadFile/gym/basketball/${dto.img }"/>" alt="" /></td>
		<td>
			<a href="<c:url value="Detail?id=${dto.id }&page=${nowPage }"/>">${dto.title }</a>
		</td>
		<td>${dto.manager_id }</td>
		<td>
		<fmt:formatDate value="${dto.reg_date }" pattern="yy-MM-dd"/>
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
	<tr>
		<td colspan="5" align="right">
			<a href="<c:url value="InsertForm?page=${nowPage }"/>">글쓰기</a>
		</td>
	</tr>
</table>