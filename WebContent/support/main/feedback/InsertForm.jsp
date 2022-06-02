<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <h1>고객말씀</h1>
<h2>글 작성 폼</h2>

<form action="InsertReg" method="post" enctype="multipart/form-data">
	<table border="">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" /></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="pname" /></td>
		</tr>
		<tr>
			<th>암호</th>
			<td><input type="text" name="pw" /></td>
		</tr>
		<tr>
			<th>파일</th>
			<td><input type="file" name="upfile" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" cols ="30" rows="5" ></textarea></td>
		</tr>
		<tr>
			
			<td colspan="2" align="center">
			<a href="<c:url value="List"/>">목록으로</a>
			<input type="reset" value="취소" />
			<input type="submit" value="작성" />
			
			</td>
		</tr>
	</table>
</form>