<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <form action="PostInsert_Reg" method="post" enctype="multipart/form-data">
 
 
 	<input type="hidden" name="userId" value="${User.pid }" />
 	<input type="hidden" name="userEmail" value="${User.email }" />
 	<input type="hidden" name="userNum" value="${User.phoneNum }" />
 	
    	<table border="">
    		<tr>
    			<td colspan="2"><input type="text" name="title" placeholder="상품명을 입력해주세요" style="width:500px;"/></td>
    		</tr>
    		<tr>
    			<th>상품 상태</th>
    			<td>
	    			<select name="check_quality" >
						<option>미개봉</option>
						<option>거의새것</option>
						<option>사용감있음</option>
					</select>
				</td>
    		</tr>
    		<tr>
    			<th>상품 카테고리 선택</th>
    			<td>
	    			<select name="l_category" >
						<option>축구용품</option>
						<option>농구용품</option>
					</select>
				</td>
    		</tr>
    		<tr>
    			<th>소 카테고리 선택</th>
    			<td>
    				<select name="s_category" >
						<option>신발</option>
						<option>의류</option>
						<option>기타용품</option>
					</select>
    			</td>
    		</tr>
    		<tr>
    			<th>거래방법</th>
    			<td>
    				<select name="delivery" >
						<option>택배</option>
						<option>직거래</option>
					</select>
    			</td>
    		</tr>
    		<tr>
    			<th>금액</th>
    			<td><input type="text" name="price"/></td>
    		</tr>
    		<tr>
    			<td colspan="2">
    			<textarea name="content" id="content" cols="70" rows="50"
    						style="width:500px; height:500px"></textarea></td>
    		</tr>
    		<tr>
	    		<td colspan="2" align="right">
	    			<button href="">뒤로가기</button>
	    			<input type="submit"  />
	    		</td>
    		</tr>
    	</table>
    </form>