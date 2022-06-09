<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <form action="LoginReg" method="post">
    	<table border="">
    		<tr>
	    		<td>
	    			개인회원<input type="radio" name="memberkind" value="개인회원" checked/>
	    			법인회원<input type="radio" name="memberkind" value="법인회원"/>
	    		</td>
    		</tr>
    		<tr>
    			<td>ID</td>
    			<td><input type="text" name="pid"/></td>
    		</tr>
    		<tr>
    			<td>PW</td>
    			<td><input type="password" name="pw" /></td>
    			<td rowspan="2">
				<input type="submit" value="로그인" />
				</td>
    		</tr>
    		
    		<tr>
    			<td colspan="2"> 
    				<a href="<c:url value="/member/FindId"/>">아이디찾기</a>
    				<a href="<c:url value="/member/FindPw_CheckId"/>">비밀번호찾기</a>
    			</td>
    			 
    		</tr>
    	</table>
    </form>

    