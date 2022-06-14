<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;700&display=swap" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
    <link href="/readytoplay/css/findpw_reg.css" rel="stylesheet">
    
<div id="main_area">
    <div id="main_container">
        <form action="PwChange" method="post">
            <div id="input_area">
                <div class="form-floating">
                    <p>새로운 비밀번호를 입력해주세요</p>
                    <input type="password" class="form-control" id="pw" name="pw">
                </div>
            </div>
            <div id="next_btn">
                <button class="w-100 btn btn-lg btn-primary" type="submit" >다음</button>
                <input type="hidden" name="email" value="${email }"/>
				<input type="hidden" name="memberkind" value="${memberkind }"/>
            </div>
        </form>
    </div>
</div>