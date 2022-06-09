<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form action="PostModify_Reg" method="post">
	<table border="">
		<tr>
			<td colspan="2"><input type="text" name="title"
				value="${dto.title }" /></td>
		</tr>
		<tr>
			<th>판매자 아이디</th>
			<td>${dto.user_id }<input type="hidden" name="dto.user_id"
				value="${dto.user_id }" /></td>
		</tr>
		<tr>
			<th>판매자 이메일</th>
			<td><input type="text" name="user_email"
				value="${dto.user_email }" /></td>
		</tr>
		<tr>
			<th>판매자 번호</th>
			<td><input type="text" name="user_num" value="${dto.user_num }" /></td>
		</tr>
		<tr>
			<th>상품상태</th>
			<td><select name="check_quality">
					<option>미개봉</option>
					<option>거의새것</option>
					<option>사용감있음</option>
			</select></td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td><select name="l_category">
					<option>축구용품</option>
					<option>농구용품</option>
			</select> > <select name="s_category">
					<option>신발</option>
					<option>의류</option>
					<option>기타용품</option>
			</select></td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td><input type="text" name="price" value="${dto.price }" /></td>
		</tr>
		<tr>
			<th>거래방법</th>
			<td><select name="delivery">
					<option>택배</option>
					<option>직거래</option>
			</select></td>
		</tr>

		<tr>
			<td colspan="2"><textarea name="content" id="content" cols="70"
					rows="50" style="width: 500px; height: 500px">${dto.content }</textarea>
				<input type="hidden" name="post_id" value="${dto.post_id }" /></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" value="수정 완료" /></td>
		</tr>
	</table>
</form>