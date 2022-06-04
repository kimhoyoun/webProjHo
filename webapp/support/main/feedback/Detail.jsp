<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h1>고객 말씀</h1>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table>
	<tr>
		<td>제목</td>
		<td>${dto.title }</td>
	</tr>
	<tr>
		<td>분류</td>
		<td>${dto.filter }</td>
	</tr>
	<tr>
		<td>본문</td>
		<td>${dto.question }</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${dto.user_id }</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${dto.reg_date }</td>
	</tr>
</table>

<br />
<c:choose>
	<c:when test="${dto_answer != null }">
	
	
	

---------- 답변 ----------------- <br />
<table>
	<tr>
		<td>본문</td>
		<td>${dto_answer.answer }</td>	
	</tr>
	<tr>
		<td>답변일</td>
		<td>${dto_answer.reg_date }</td>	
	</tr>
</table>
<a href="ModifyFormA?id=${dto_answer.id }&page=${nowPage}">수정</a>
<a href="DeleteFormA?id=${dto_answer.id }&page=${nowPage}">삭제</a>
<br />
	</c:when>

	<c:otherwise>
	<a href="InsertFormA?question_id=${dto.id }">답변 작성</a> <br />
	</c:otherwise>
	
	</c:choose>
<a href="List?page=${nowPage }">목록으로</a> <br />

<a href="MyQuestion?user_id=${dto.user_id }&page=${nowPage }">뒤로</a>
<a href="ModifyFormQ?id=${dto.id }&page=${nowPage}">수정</a>
<a href="DeleteFormQ?id=${dto.id }&page=${nowPage}">삭제</a>


