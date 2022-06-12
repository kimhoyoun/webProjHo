<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <h1>대관 입력</h1>
    
    
<form action="ModifyReg" method="post">

<input type="hidden" name="id" value="${dto.id }" />

<table>
	<tr>
		<th>경기장</th>
		<td><input type="text" name="title" value="${dto.sname }"/></td>
	</tr>
	<tr>
		<th>contents_info</th>
		<td><input type="text" name="contents_info" value="${dto.contents_info }"/></td>
	</tr>
	<tr>
		<th>contents_detail</th>
		<td><input type="text" name="contents_detail" value="${dto.contents_detail }"/></td>
	</tr>
	<tr>
		<th>contents_rule</th>
		<td><input type="text" name="contents_rule" value="${dto.contents_rule }"/></td>
	</tr>
	<tr>
		<th>contents_refund</th>
		<td><input type="text" name="contents_refund" value="${dto.contents_refund }"/></td>
	</tr>
	<tr>
		<th>option</th>
		<td>
		<label><input type="checkbox" name = "option1" value="true" <c:if test="${dto.option1}">checked</c:if>/> 샤워장</label>
		<label><input type="checkbox" name = "option2" value="true" <c:if test="${dto.option2}">checked</c:if>/> 주차장</label>
		<label><input type="checkbox" name = "option3" value="true" <c:if test="${dto.option3}">checked</c:if>/> 냉/난방시설</label>
		<label><input type="checkbox" name = "option4" value="true" <c:if test="${dto.option4}">checked</c:if>/> 정수기</label>
		<label><input type="checkbox" name = "option5" value="true" <c:if test="${dto.option5}">checked</c:if>/> 마루바닥</label>
		</td>
	</tr>
	<tr>
		<th>가격</th>
		<td>
			평일 주간 : <input type="text" name = "price_weekday_weekly" value="${dto.price_weekday_weekly }"/>
			평일 야간 : <input type="text" name = "price_weekday_nighttime" value="${dto.price_weekday_nighttime }"/>
			<br />
			주말 주간 : <input type="text" name = "price_weekend_weekly" value="${dto.price_weekend_weekly }"/>
			주말 야간 : <input type="text" name = "price_weekend_nighttime" value="${dto.price_weekend_nighttime }"/>
		</td>
	</tr>
	<tr>
		<th>주소</th>
			<td>
			<input type="text" name="postcode" id="postcode" placeholder="우편번호" value = "${dto.postcode }" readonly>
   			<input type="button" onclick="on()" value="우편번호 찾기"><br>
		    <input type="text" name=address id="address" placeholder="주소" value = "${dto.address }"readonly><br>
		    <input type="text" name="detailAddress" id="detailAddress" value = "${dto.postcode }" placeholder="상세주소">
		    <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목" readonly>
		    </td>
	</tr>
	<tr>
		<th>사용불가 시간</th>
		<td >
		${dto.unused_time }
		<label><input class = 'unused_time_input' type="checkbox" name = "unused_time" value="0" /> 00시~02시</label>
		<label><input class = 'unused_time_input' type="checkbox" name = "unused_time" value="1" /> 02시~04시</label>
		<label><input class = 'unused_time_input' type="checkbox" name = "unused_time" value="2" /> 04시~06시</label>
		<label><input class = 'unused_time_input' type="checkbox" name = "unused_time" value="3" /> 06시~08시</label>
		<label><input class = 'unused_time_input' type="checkbox" name = "unused_time" value="4" /> 08시~10시</label>
		<label><input class = 'unused_time_input' type="checkbox" name = "unused_time" value="5" /> 10시~12시</label>
		<label><input class = 'unused_time_input' type="checkbox" name = "unused_time" value="6" /> 12시~14시</label>
		<label><input class = 'unused_time_input' type="checkbox" name = "unused_time" value="7" /> 14시~16시</label>
		<label><input class = 'unused_time_input' type="checkbox" name = "unused_time" value="8" /> 16시~18시</label>
		<label><input class = 'unused_time_input' type="checkbox" name = "unused_time" value="9" /> 18시~20시</label>
		<label><input class = 'unused_time_input' type="checkbox" name = "unused_time" value="10" /> 20시~22시</label>
		<label><input class = 'unused_time_input' type="checkbox" name = "unused_time" value="11" /> 22시~24시</label>
		</td>
	</tr>
	
	<tr>
		<td colspan = "2" align = "center">
		<a href="List">돌아가기</a>
		<input type="submit" value="입력" />
		<input type="reset" value="취소" />
		</td>
	</tr>
</table>		
</form>		

<script>
	const unused_time_input = document.querySelectorAll('.unused_time_input')
	var str = '${dto.unused_time}'
	const arr = str.split(',')
	if(str.length >0){
		for(var i = 0; i<arr.length; i++){
			$(unused_time_input[arr[i]]).prop('checked',true)
		}		
	}
	
</script>