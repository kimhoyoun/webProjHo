<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>


<div id="main_wrap">
        <div><h2 id="main_title">공지사항</h2></div>
        <hr>
        
        <div id="Search">
            <form action="Search">
                <select name="filter" id="">
                    <option value="전체">전체</option>
			        <option value="서버">서버</option>
			        <option value="대관">대관</option>
			        <option value="수강">수강</option>
			        <option value="게시판">게시판</option>
			        <option value="공지">공지</option>
                </select>
                <input type="text" name = "keyword"/>
	            <input type="submit"  value="검색"/>
            </form>  
        </div>
        
        <div id="notice">
            <table class="table table-hover">
                <thead>
                  <tr>
                    <th class="num" scope="col">번호</th>
                    <th class="title" scope="col">제목</th>
                    <th class="user_id" scope="col">분류</th>
                    <th class="reg_date" scope="col">작성일</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach var="dto" items="${mainData }" varStatus="no">
		
						<tr>
							<td class="num" scope="row" >${ start + no.index+1}</td>
							<td class = "title">
								<a href="<c:url value="Detail?id=${dto.id }&page=${nowPage }"/>">${dto.title }</a>
							</td>
							<td class = "user_id">${dto.filter }</td>
							<td  class = "reg_date" scope="col">
								<fmt:formatDate value="${dto.reg_date }" pattern="yy-MM-dd"/>
							</td>
						</tr>
						</c:forEach>
                </tbody>
                <tfoot>
                    <tr><td class="BTNnewWrite" colspan="5" align="right">
                    <a href="<c:url value="InsertForm?page=${nowPage }"/>"><button type="button" class="btn btn-outline-info" onclick="insert()">새글쓰기</button></a>
<!--                     <input type="button" value="새글쓰기" onclick="insert()"> -->
                    </td>
                    </tr>
                    <tr><td class="paging" colspan="5">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                              <li class="page-item">
	                            <c:if test="${pageStart > 1 }">
	                            	 <a class="page-link"  href="<c:url value="List?page=${pageStart-1 }"/>">이전</a>
								</c:if>
                           	 </li>
							<c:forEach var ="i" begin="${pageStart }" end="${pageEnd }" step="1"> 
								<c:choose>
									<c:when test="${nowPage == i }">
											<li class="page-item disabled">
												<a class="page-link" href="<c:url value="List?page=${i }"/>">${i }</a>
											</li>
									</c:when>		
									
									<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="<c:url value="List?page=${i }"/>">${i }</a>
									</li>
									</c:otherwise>		
								</c:choose>
							</c:forEach>
                              	<li class="page-item">
		                   			<c:if test="${pageEnd<pageTotal }">
		                                <a class="page-link" href="<c:url value="List?page=${pageEnd+1 }"/>">다음</a>
									</c:if>
								</li>
                            </ul>
                          </nav>
                    </td></tr>
                </tfoot>
              </table>    
        </div>
        
    </div>
<script>
function insert(){
	location.href = '<c:url value="InsertForm?page=${nowPage }"/>'
}
</script>
<%-- 			<a href="<c:url value="InsertForm?page=${nowPage }"/>">글쓰기</a> --%>
