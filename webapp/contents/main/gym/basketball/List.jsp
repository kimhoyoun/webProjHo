<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}
</style>

<h1>농구 대관페이지</h1>



<div id="calendar_wrap" >
	<div id = "calendar">
		<input type="text" name="selectDate" id="selectDate" class="ts" autocomplete="off" value="${dateSet }"/>
		<script>
		
		var setDate=null;
			$(function(){
				$('#selectDate').datepicker({
					lang:'ko',
					dateFormat: 'yy-mm-dd',
					monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
			        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip
			        dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 텍스트
			        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], //달력의 요일 Tooltip
			        minDate:0,
			        maxDate:'+2M',
			        onSelect: function(dateText, inst){
			        	
			        	var arr = dateText.split("/")
			        	var date = arr[0]
			        	location.href="List?page=${nowPage}&dateSet="+date;
			        }
				});
// 				var date = ${dateSet}
// 				if(date != null){
// 					$('#selectDate').datepicker('setDate', date);
// 				}else{
// 				$('#selectDate').datepicker('setDate', 'today');
// 				}
			})
	</script>
	</div>
	
</div>

<div id = "table_wrap">

<table border=""> 

	<tr>
		<th>이미지</th>
		<th>경기장</th>
		<th>매니저</th>
		<th>작성일</th>
	</tr>
	<c:forEach var="dto" items="${mainData }" varStatus="no">
		
	<tr>
		<td>
			<img src="<c:url value="/uploadFile/gym/basketball/${fn:split(dto.img, ',')[0]}"/>" alt="" />
		</td>
		<td>
			<a href="<c:url value="Detail?id=${dto.id }&page=${nowPage }&dateSet=${dateSet }"/>">${dto.sname }</a>
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
</div>