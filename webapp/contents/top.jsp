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

  <div class="container">
      <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <a class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-decoration-none" href="<c:url value="/"/>">
          <img src="<c:url value="/images/logo.png"/>" alt="프로젝트이름">
        </a>
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle link-dark" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">대관</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<c:url value="/gym/basketball/List"/>">농구 경기장</a></li>
                  <li><a class="dropdown-item" href="#scrollspyHeading4">축구 경기장</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle link-dark" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">레슨</a>
            <ul class="dropdown-menu">
             <li><a class="dropdown-item" href="<c:url value="/lesson/bas/List"/>">농구 레슨</a></li>
             <li><a class="dropdown-item" href="#scrollspyHeading4">축구 레슨</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle link-dark" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">농구 게시판</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<c:url value="/commu_bas/board/List"/>">자유 게시판</a></li>
                  <li><a class="dropdown-item" href="#scrollspyHeading4">대회 정보</a></li>
                  <li><a class="dropdown-item" href="#scrollspyHeading4">용병 게시판</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle link-dark" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">축구 게시판</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<c:url value="/commu_bas/board/List"/>">자유 게시판</a></li>
                  <li><a class="dropdown-item" href="#scrollspyHeading4">대회 정보</a></li>
                  <li><a class="dropdown-item" href="#scrollspyHeading4">용병 게시판</a></li>
            </ul>
          </li>
           <li class="nav-item">
                <a class="nav-link link-dark"" href="<c:url value="/market/PostList"/>">장터</a>
              </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle link-dark" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">고객 지원</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<c:url value="/support/notice/List"/>">공지사항</a></li>
                  <li><a class="dropdown-item" href="<c:url value="/support/faq/List"/>">FAQ</a></li>
                  <li><a class="dropdown-item" href="<c:url value="/support/feedback/home"/>">Q&A</a></li>
            </ul>
          </li>
        </ul>
  
        <div class="col-md-3 text-end">
         <c:choose>
				<c:when test="${User==null }">
					<button type="button" class="btn btn-outline-primary me-2">LOGIN</button>
          			<button type="button" class="btn btn-primary">Sign-up</button>
				</c:when>
				<c:otherwise>
					 <button type="button" class="btn btn-outline-primary me-2">LOGOUT</button>
         			 <button type="button" class="btn btn-primary">MYPAGE</button>
				</c:otherwise>
			</c:choose>
        </div>
      </header>
    </div>
  
  
<!--   <header> -->
<!--       Fixed navbar -->
<!--       <nav class="navbar navbar-expand-md navbar-light fixed-top bg-light" > -->
<!--         <div class="container-fluid"> -->
<%--           <a class="navbar-brand" href="<c:url value="/"/>">Ready to Play</a> --%>
<!--           <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"> -->
<!--             <span class="navbar-toggler-icon"></span> -->
<!--           </button> -->
<!--           <div class="collapse navbar-collapse" id="navbarCollapse" > -->
<!--             <ul class="navbar-nav me-auto mb-2 mb-md-0"> -->
<!--               <li class="nav-item dropdown"> -->
<!--                 <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">대관</a> -->
<!--                 <ul class="dropdown-menu"> -->
<%--                   <li><a class="dropdown-item" href="<c:url value="/gym/basketball/List"/>">농구 경기장</a></li> --%>
<!--                   <li><a class="dropdown-item" href="#scrollspyHeading4">축구 경기장</a></li> -->
<!--                 </ul> -->
<!--               </li> -->
<!--               <li class="nav-item dropdown"> -->
<!--                 <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">레슨</a> -->
<!--                 <ul class="dropdown-menu"> -->
<%--                   <li><a class="dropdown-item" href="<c:url value="/lesson/bas/List"/>">농구 레슨</a></li> --%>
<!--                   <li><a class="dropdown-item" href="#scrollspyHeading4">축구 레슨</a></li> -->
<!--                 </ul> -->
<!--               </li> -->
<!--               <li class="nav-item dropdown"> -->
<!--                 <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">농구 게시판</a> -->
<!--                 <ul class="dropdown-menu"> -->
<%--                   <li><a class="dropdown-item" href="<c:url value="/commu_bas/board/List"/>">자유 게시판</a></li> --%>
<!--                   <li><a class="dropdown-item" href="#scrollspyHeading4">대회 정보</a></li> -->
<!--                   <li><a class="dropdown-item" href="#scrollspyHeading4">용병 게시판</a></li> -->
<!--                 </ul> -->
<!--               </li> -->
<!--               <li class="nav-item dropdown"> -->
<!--                 <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">축구 게시판</a> -->
<!--                 <ul class="dropdown-menu"> -->
<!--                   <li><a class="dropdown-item" href="#scrollspyHeading3">자유 게시판</a></li> -->
<!--                   <li><a class="dropdown-item" href="#scrollspyHeading4">대회 정보</a></li> -->
<!--                   <li><a class="dropdown-item" href="#scrollspyHeading4">용병 게시판</a></li> -->
<!--                 </ul> -->
<!--               </li> -->
<!--               <li class="nav-item"> -->
<%--                 <a class="nav-link" href="<c:url value="/market/PostList"/>">장터</a> --%>
<!--               </li> -->
<!--               <li class="nav-item dropdown"> -->
<!--                 <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button"aria-current="page" href="#"  aria-expanded="false">고객 지원</a> -->
<!--                 <ul class="dropdown-menu"> -->
<%--                   <li><a class="dropdown-item" href="<c:url value="/support/notice/List"/>">공지사항</a></li> --%>
<%--                   <li><a class="dropdown-item" href="<c:url value="/support/faq/List"/>">FAQ</a></li> --%>
<%--                   <li><a class="dropdown-item" href="<c:url value="/support/feedback/home"/>">Q&A</a></li> --%>
<!--                 </ul> -->
<!--               </li> -->
<%--               <c:choose> --%>
<%-- 				<c:when test="${User==null }"> --%>
<!-- 					 <li class="nav-item"> -->
<%-- 		                <a class="nav-link" href="<c:url value="/market/PostList"/>">LOGIN</a> --%>
<!-- 		              </li> -->
<!-- 		              <li class="nav-item"> -->
<%-- 		                <a class="nav-link" href="<c:url value="/market/PostList"/>">JOIN</a> --%>
<!-- 		              </li> -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 					<li class="nav-item"> -->
<%-- 		                <a class="nav-link" href="<c:url value="/member/Logout"/>">LOGOUT</a> --%>
<!-- 		              </li> -->
<!-- 		              <li class="nav-item"> -->
<%-- 		                <a class="nav-link" href="<c:url value="/mypage/info/InputPass"/>">MYPAGE</a> --%>
<!-- 		              </li> -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<!--             </ul> -->
<!--           </div> -->
<!--         </div> -->
<!--       </nav> -->
<!--     </header> -->