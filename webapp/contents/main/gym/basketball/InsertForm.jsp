<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <h1>대관 입력</h1>
    
    
<form action="InsertReg" method="post" enctype="multipart/form-data">


<table>
	<tr>
		<td>
			<select name="manager_id" id="">
				<option value="none">===매니저===</option>
				<c:forEach var="mem" items="${mainData }">
					<option value="${mem }">${mem }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="sname"/></td>
	</tr>
	<tr>
		<th>contents_info</th>
		<td><input type="text" name="contents_info"/></td>
	</tr>
	<tr>
		<th>contents_detail</th>
		<td><input type="text" name="contents_detail"/></td>
	</tr>
	<tr>
		<th>contents_rule</th>
		<td><input type="text" name="contents_rule"/></td>
	</tr>
	<tr>
		<th>contents_refund</th>
		<td><input type="text" name="contents_refund"/></td>
	</tr>
	<tr>
		<th>option</th>
		<td>
		<label><input type="checkbox" name = "option1" value="true"/> 샤워장</label>
		<label><input type="checkbox" name = "option2" value="true"/> 주차장</label>
		<label><input type="checkbox" name = "option3" value="true"/> 냉/난방시설</label>
		<label><input type="checkbox" name = "option4" value="true"/> 정수기</label>
		<label><input type="checkbox" name = "option5" value="true"/> 마루바닥</label>
		</td>
	</tr>
	<tr>
		<th>가격</th>
		<td>
			평일 주간 : <input type="text" name = "price_weekday_weekly"/>
			평일 야간 : <input type="text" name = "price_weekday_nighttime"/>
			<br />
			주말 주간 : <input type="text" name = "price_weekend_weekly"/>
			주말 야간 : <input type="text" name = "price_weekend_nighttime"/>
		</td>
	</tr>
	<tr>
		<th>주소</th>
			<td>
			<input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly>
   			<input type="button" onclick="on()" value="우편번호 찾기"><br>
		    <input type="text" name=address id="address" placeholder="주소" readonly><br>
		    <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
		    <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목" readonly>
		    </td>
	</tr>
	<tr>
		<th>이미지</th>
		<td><input type="file" name ="img" multiple /></td>
	</tr>
	<tr>
		<th>사용불가 시간</th>
		<td>
		<label><input type="checkbox" name = "unused_time" value="0"/> 00시~02시</label>
		<label><input type="checkbox" name = "unused_time" value="1"/> 02시~04시</label>
		<label><input type="checkbox" name = "unused_time" value="2"/> 04시~06시</label>
		<label><input type="checkbox" name = "unused_time" value="3"/> 06시~08시</label>
		<label><input type="checkbox" name = "unused_time" value="4"/> 08시~10시</label>
		<label><input type="checkbox" name = "unused_time" value="5"/> 10시~12시</label>
		<label><input type="checkbox" name = "unused_time" value="6"/> 12시~14시</label>
		<label><input type="checkbox" name = "unused_time" value="7"/> 14시~16시</label>
		<label><input type="checkbox" name = "unused_time" value="8"/> 16시~18시</label>
		<label><input type="checkbox" name = "unused_time" value="9"/> 18시~20시</label>
		<label><input type="checkbox" name = "unused_time" value="10"/> 20시~22시</label>
		<label><input type="checkbox" name = "unused_time" value="11"/> 22시~24시</label>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function on(){
	execDaumPostcode();
	
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = ''; 
	            var extraAddr = ''; 

	            if (data.userSelectedType === 'R') { 
	                addr = data.roadAddress;
	            } else { 
	                addr = data.jibunAddress;
	            }

	            if(data.userSelectedType === 'R'){
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                document.getElementById("extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }

	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("address").value = addr;
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	}
}
</script>
