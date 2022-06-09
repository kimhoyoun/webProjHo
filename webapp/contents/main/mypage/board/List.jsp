<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <jsp:include page="../sideMenu.jsp"/>
<h1>내가 쓴 글</h1>

<c:set var = "type" value="gym"/>
<table border="">
	<tr>
		<th>게시판 종류</th>
		<th>제목</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<c:forEach var="dto" items="${mainData }" varStatus="no">
		
	<tr>
		<td>
			<c:choose>
				<c:when test = "${fn:contains(dto.post_id, 'bas_board')}">
					<c:set var = "type" value="../../commu_bas/board/Detail?post_id=${dto.post_id }"/>
					농구 자유게시판
				</c:when>
				<c:when test = "${fn:contains(dto.post_id, 'bas_compet')}">
					<c:set var = "type" value="../../commu_bas/compet/Detail?post_id=${dto.post_id }"/>
					농구 대회정보
				</c:when>
				<c:when test = "${fn:contains(dto.post_id, 'bas_guest')}">
					<c:set var = "type" value="../../commu_bas/guest/Detail?post_id=${dto.post_id }"/>
					농구 용병
				</c:when>
				<c:when test = "${fn:contains(dto.post_id, 'soc_board')}">
					<c:set var = "type" value="../../commu_soc/board/Detail?post_id=${dto.post_id }"/>
					축구 자유게시판
				</c:when>
				<c:when test = "${fn:contains(dto.post_id, 'soc_compet')}">
					<c:set var = "type" value="../../commu_soc/compet/Detail?post_id=${dto.post_id }"/>
					축구 대회정보
				</c:when>
				<c:when test = "${fn:contains(dto.post_id, 'soc_guest')}">
					<c:set var = "type" value="../../commu_soc/guest/Detail?post_id=${dto.post_id }"/>
					축구 용병
				</c:when>
				<c:otherwise>
				<c:set var = "type" value="../../market/PostDetail_Reg?post_id=${dto.post_id }"/>
					마켓
				</c:otherwise>
			</c:choose>
		</td>
		
		<td><a href="<c:url value="${type }"/>">${dto.title }</a></td>
		
		<td>
		<fmt:formatDate value="${dto.reg_date }" pattern="yy-MM-dd"/>
		</td>
		<td>${dto.cnt }</td>
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