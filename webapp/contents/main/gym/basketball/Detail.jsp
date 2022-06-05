<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>대관 상세</h1>

<table>
	<tr>
		<th>제목</th>
		<td>${dto.title }</td>
	</tr>
	<tr>
		<th>이미지</th>
		<td><img src="<c:url value="/uploadFile/gym/basketball/${dto.img }"/>" alt="" /></td>
	</tr>
	<tr>
		<th>info</th>
		<td>${dto.contents_info }</td>
	</tr>
	<tr>
		<th>detail</th>
		<td>${dto.contents_detail }</td>
	</tr>
	<tr>
		<th>rule</th>
		<td>${dto.contents_rule }</td>
	</tr>
	<tr>
		<th>refund</th>
		<td>${dto.contents_refund }</td>
	</tr>
	<tr>
		<th>option</th>
		<td>샤워장 : ${dto.option1 }, 주차장 : ${dto.option2 }, 냉/난방시설 : ${dto.option3 }, 
		정수기 : ${dto.option4 }, 마루바닥 : ${dto.option5 }</td>
	</tr>
	<tr>
		<th>price</th>
		<td>평일 주간 : ${dto.price_weekday_weekly }원, 평일 야간 : ${dto.price_weekday_nighttime }원, <br />
		주말 주간 : ${dto.price_weekend_weekly }원, 주말 야간 : ${dto.price_weekend_nighttime }원</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${dto.location }</td>
	</tr>
	<tr>
		<th>매니저</th>
		<td>${dto.manager_id }</td>
	</tr>
	<tr>
		<td colspan = "2"><a href="List?page=${nowPage }">목록으로</a>
		<a href="ModifyForm?id=${dto.id }&page=${nowPage}">수정</a>
		<a href="DeleteForm?id=${dto.id }&oage=${nowPage}">삭제</a></td>
	</tr>
</table>