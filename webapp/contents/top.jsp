<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script>
	
// 	document.addEventListener('DOMContentLoaded', ()=>{
	
// 		const mainMenu = document.querySelectorAll('#mainmenu_list>li>a')
// 		const headerWrap = document.querySelector('#header_wrap')
// 		const subMenu = document.querySelectorAll('.submenu_list')
		
// 		for(const item of mainMenu){
// 			item.addEventListener('mouseenter',mainMenuOver)
// 		}
		
// 		headerWrap.addEventListener('mouseleave',mainMenuLeave)
		
		
// 		function mainMenuOver(){
// 			menuActivate()
// 		}
		
// 		function mainMenuLeave(){
// 			menuInActivate()
// 		}
		
// 		function menuActivate(){
// 			gsap.to(headerWrap, {height:215, duration : 0.3, ease:'power1.out'})
// 			for(const item of subMenu){
// 				gsap.set(item, {display:'block'})
// 			}
// 		}
		
// 		function menuInActivate(){
// 			gsap.to(headerWrap, {height:114, duration : 0.3, ease:'power1.out'})
// 			for(const item of subMenu){
// 				gsap.set(item, {display:'none'})
// 			}
// 		}
// 	})
	

</script>

  <div id="header_wrap">
    <header>
        <h1 id="logo"><a href="<c:url value="/"/>" title="클램쉘메인페이지바로가기"><img src="<c:url value="/images/logo.png"/>" alt="프로젝트이름"></a></h1>
        <nav id="topmenu">
          <h2 class="hidden">상단빠른메뉴</h2>
          <ul id="topmenu_list">
			<c:choose>
				<c:when test="${User==null }">
					 <li><a href="<c:url value="/member/Login"/>">LOGIN</a></li>
            		<li><a href="<c:url value="/member/TypeSelect"/>">JOIN</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="<c:url value="/member/Logout"/>">LOGOUT</a></li>
					<li><a href="<c:url value="/member/Login"/>">MYPAGE</a></li>
				</c:otherwise>
			</c:choose>
            
          </ul>
        </nav>
        
        <nav id="mainmenu">
            <h2 class="hidden">메인메뉴</h2>
            <ul id="mainmenu_list">
              <li>
                <a href="<c:url value="/info/Hello"/>">경기장대관</a>
                <ul class="submenu_list">
                  <li><a href="<c:url value="/gym/basketball/List"/>">농구장</a></li>
                  <li><a href="#">축구장</a></li>
                </ul>
              </li>

              <li>
                <a href="#">레슨</a>
                <ul class="submenu_list">
                  <li><a href="<c:url value="/lesson/bas/List"/>">농구</a></li>
                  <li><a href="#">축구</a></li>
                </ul>
              </li>
              <li>
                <a href="#">농구게시판</a>
                <ul class="submenu_list">
                  <li><a href="#">대회정보</a></li>
                  <li><a href="#">자유게시판</a></li>
                  <li><a href="#">용병</a></li>
                </ul>
              </li>
              <li>
                <a href="#">축구게시판</a>
                <ul class="submenu_list">
                  <li><a href="#">대회정보</a></li>
                  <li><a href="#">자유게시판</a></li>
                  <li><a href="#">용병</a></li>
                </ul>
              </li>
              <li>
                <a href="<c:url value="/market/PostList"/>">장터</a>
              </li>
              <li>
                <a href="<c:url value="/support/notice/List"/>">고객지원</a>
                <ul class="submenu_list">
                  <li><a href="<c:url value="/support/notice/List"/>">공지사항</a></li>
                  <li><a href="<c:url value="/support/faq/List"/>">자주묻는 질문</a></li>
                  <li><a href="<c:url value="/support/feedback/home"/>">고객 말씀</a></li>
                  <li><a href="<c:url value="/support/info/List"/>">홈페이지 정보</a></li>
                </ul>
              </li>
              
              <li>
                <a href="<c:url value="/manager/adjustment/MainPage"/>">관리자</a>
                <ul class="submenu_list">
                  <li><a href="<c:url value="/manager/adjustment/MainPage"/>">정산</a></li>
                  <li><a href="<c:url value="/support/faq/List"/>">자주묻는 질문</a></li>
                  <li><a href="<c:url value="/support/feedback/home"/>">고객 말씀</a></li>
                  <li><a href="<c:url value="/support/info/List"/>">홈페이지 정보</a></li>
                </ul>
              </li>
            </ul>
        </nav>
    </header>
  </div>