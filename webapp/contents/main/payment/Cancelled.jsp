<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>환불띠</h1>


uid : ${imp_uid }
<form action="CancelledReg" method="post">
	<input type="hidden" name = "imp_uid" value="${imp_uid }" />
	<input type="submit" value="환불하기" />
</form>