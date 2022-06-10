<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<h1>공지사항</h1>


<form action="">
	<select name="filter" id="">
        <option value="전체" <c:if test = "${param.filter == \"전체\" }">selected</c:if>  >전체</option>
        <option value="서버" <c:if test = "${param.filter == \"서버\" }">selected</c:if>  >서버</option>
        <option value="대관" <c:if test = "${param.filter == \"대관\" }">selected</c:if>  >대관</option>
        <option value="수강" <c:if test = "${param.filter == \"수강\" }">selected</c:if>  >수강</option>
        <option value="게시판" <c:if test = "${param.filter == \"게시판\" }">selected</c:if>  >게시판</option>
        <option value="공지" <c:if test = "${param.filter == \"공지\" }">selected</c:if>  >공지</option>
      </select> 
	
		<input type="text" name = "keyword" value = "${param.keyword }"/>
	
	<input type="submit"  value="검색"/>
</form>

<table border =""> 

	
	<c:forEach var="dto" items="${mainData }" varStatus="no">
		
	<tr>
<%-- 		<td>${ start + no.index+1}</td> --%>
		<td>
			<a href="<c:url value="Detail?id=${dto.id }&page=${nowPage }"/>">${dto.title }</a>
		</td>
		<td>${dto.filter }</td>
		<td>
		<fmt:formatDate value="${dto.reg_date }" pattern="yy-MM-dd"/>
		</td>
	</tr>
	
	</c:forEach>
	<tr>
		<td colspan="5" align="center">
			<c:if test="${pageStart > 1 }">
				<a href="<c:url value="Search?page=${pageStart-1 }&filter=${param.filter }&keyword=${param.keyword }"/>">[이전]</a>
			</c:if>
			<c:forEach var ="i" begin="${pageStart }" end="${pageEnd }" step="1">
				<c:choose>
					<c:when test="${nowPage == i }">
							[${i }]
					</c:when>		
					
					<c:otherwise>
					<a href="<c:url value="Search?page=${i }&filter=${param.filter }&keyword=${param.keyword }"/>">${i }</a>
					</c:otherwise>		
				</c:choose>
				
				
				
			</c:forEach>
			
			<c:if test="${pageEnd<pageTotal }">
			<a href="<c:url value="Search?page=${pageEnd+1 }&filter=${param.filter }&keyword=${param.keyword }"/>">[다음]</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="5" align="right">
			<a href="<c:url value="InsertForm?page=${nowPage }"/>">글쓰기</a>
		</td>
	</tr>
</table>
