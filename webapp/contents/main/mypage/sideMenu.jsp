<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<h3>마이페이지 사이드 메뉴</h3>
<ul>
	<li><a href="">정보수정</a></li>
	<c:choose>
		<c:when test = "${User.grade == 3 }">
			<li><a href="../corpres/List">대관 정보</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="../res/List">대관 내역</a></li>
		</c:otherwise>
	</c:choose>
	
	<li><a href="../board/List">내가 쓴 글</a></li>
</ul>