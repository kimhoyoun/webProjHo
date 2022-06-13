<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    div#div_input{
      width:980px;
      margin:0px auto;
      border: solid 1px black;
    }


    div#div_input form{
      width : 700px;
      margin : 0px auto;
    }

    div#input_title input{
      height: 30px;
      font-size: 30px;
      margin-top: 5px;
    }

    div#input_filter select{
      height: 30px;
      font-size: 20px;
      margin-top: 10px;
    }

    div#input_content textarea{
      font-size: 20px;
      margin-top: 10px;
    }
    
  </style>



<div id="main_wrap">

<form action="ModifyReg" method="post">
  <input type="hidden" name = "id" value="${dto.id }" />
  <input type="hidden" name = "page" value="${nowPage }" />
        
        <div class="row border-dark border-bottom" style="margin-bottom:30px">
			<h1>공지사항 수정</h1>
		</div>
        
        
        <div id="commu_bas_board_post">
          <div class="mb-3 row">
            <label for="title" class="col-sm-2 col-form-label" >제목</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="title" name = "title" value="${dto.title }" required>
            </div>
          </div>
          <div class="mb-3 row">
            <label for="title" class="col-sm-2 col-form-label">구분</label>
            <div class="col-sm-10">
              <select class ="form-select form-select-lg mb-3" name="filter" id="">
		        <option value="서버" <c:if test="${dto.filter == \"서버\"}">selected</c:if> >서버</option>
		        <option value="대관" <c:if test="${dto.filter == \"대관\"}">selected</c:if>>대관</option>
		        <option value="수강" <c:if test="${dto.filter == \"수강\"}">selected</c:if> >수강</option>
		        <option value="게시판" <c:if test="${dto.filter == \"게시판\"}">selected</c:if>>게시판</option>
		        <option value="공지" <c:if test="${dto.filter == \"공지\"}">selected</c:if>>공지</option>
		      </select> 
            </div>
          </div>
          <div class="mb-3 row">
            <label for="content" class="col-sm-2 col-form-label" >내용</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="content" name = "content" rows="15" required>${dto.content }</textarea>
            </div>
          </div>
          
          <div class="mb-3 row">
            <label for="BTN" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10 text-end" id="BTNsubmit">
             	<a href="Detail?id=${dto.id }&page=${nowPage }"><button type ="button" class="btn btn-outline-secondary">뒤로</button></a>
             	<button type="submit" class="btn btn-outline-secondary">수정</button>
            </div>
          </div>
        </div>
        </form>
           </div>   

<!--  <div id = div_input> -->
<!--   <form action="ModifyReg" method="post"> -->
<%--   <input type="hidden" name = "id" value="${dto.id }" /> --%>
<%--   <input type="hidden" name = "page" value="${nowPage }" /> --%>
<!--     <div id = "input_title"> -->
<!--       제목 :  -->
<%--       <input type="text" size = "30" name = "title" value="${dto.title }"> --%>
<!--     </div> -->
<!--     <div id = "input_filter"> -->
<!--       필터 :  -->
<!--       <select name="filter" id=""> -->
<%--         <option value="서버" <c:if test="${dto.filter == \"서버\"}">selected</c:if> >서버</option> --%>
<%--         <option value="대관" <c:if test="${dto.filter == \"대관\"}">selected</c:if>>대관</option> --%>
<%--         <option value="수강" <c:if test="${dto.filter == \"수강\"}">selected</c:if> >수강</option> --%>
<%--         <option value="게시판" <c:if test="${dto.filter == \"게시판\"}">selected</c:if>>게시판</option> --%>
<%--         <option value="공지" <c:if test="${dto.filter == \"공지\"}">selected</c:if>>공지</option> --%>
<!--       </select>  -->
<!--     </div> -->

<!--     <div id = "input_content"> -->
<!--       <p>본문</p> -->
<%--       <textarea name="content" id="" cols="60" rows="10" >${dto.content }</textarea> --%>
<!--     </div> -->

<!--     <div id ="input_submit"> -->
<%--     <a href="Detail?id=${dto.id }&page=${nowPage }">뒤로</a> --%>
<!--       <input  type="submit"> -->
<!--     </div> -->
<!--   </form> -->

<!-- </div> -->