<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="google-signin-client_id"
	content="419781358440-76ecndgo571cu486gigqk5ihg78mpl51.apps.googleusercontent.com">

<style>
#sign_list {
	width: 100px;
	margin: 0px;
	padding: 0px;
	list-style: none;
}

#sign_list {
	float: left;
	margin: 10px;
}

div#grayLayer {
	height: 100%;
	width: 100%;
	position: absolute;
	left: 0;
	top: 0;
	background: black;
	opacity: 0;
}

div#overLayer {
	width: 650px;
	height: 443px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -221px;
	margin-left: -325px;
	display: none;
}
</style>

<title>Sign</title>

<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.2/gsap.min.js "></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"
	type="text/javascript"></script>
<script>
    Kakao.init('4e6e1ec077224807651c5752c21cf5c2'); //발급받은 키 중 javascript키를 사용해준다.
    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    document.addEventListener('DOMContentLoaded',()=>{
                              //요소를 만들어라!(div)
      const grayLayer=document.createElement('div');
      const overLayer=document.createElement('div');

      // grayLayer와 overLayer를 body에 추가 하기 위해 body 를 찾아 변수에 담는다.
      const body = document.querySelector('body')
    
      // 아이디를 정해준다.
      grayLayer.id = 'grayLayer';
      overLayer.id = 'overLayer';

      // img에 이벤트를 넣기 위해 img경로를 찾아 변수에 담는다.
      const sign_list = document.querySelector('#sign_list');

      sign_list.addEventListener('click',clickImgMenu);

      grayLayer.addEventListener('click', hideModalWindow)

      function clickImgMenu(){
        showModalWindow();
      }

      function showModalWindow(){
        body.append(grayLayer)
        gsap.set(grayLayer, {display:'block'})
        gsap.to(grayLayer, {opacity:0.3, duration:0.3, ease:'power1.out'})

        body.append(overLayer);
        gsap.set(overLayer, {display : 'block'})
                //HTML을 넣어준다.
        overLayer.innerHTML="<a href='javascript:void(0)' onclick='kakaoLogin();'>" +
  							"<img src='/member/member/resource/kakao_login.png'>" +
  							"<a href='javascript:void(0)' onclick='googleLogin();' id='GgCustomLogin'>" +
  							"<img src='/member/member/resource/google_login.png'>" +
  							"<a href='javascript:void(0)' onclick='naverLogin();' id='naverIdLogin_loginButton'>" +
  							"<img src='/member/member/resource/google_login.png'>" +
  							"<a href='InsertMember' onclick='naverLogin();'>" +
  							"<img src='/member/member/resource/google_login.png'>"
      }       
    function hideModalWindow(){
      gsap.set(overLayer, {display:'none'})
      gsap.to(grayLayer, {opacity:0, duration:0.3, ease:'power1.out', onComplete:()=>{
        gsap.set(grayLayer, {display:'none'})
      }})
    }
   })
   
   function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  var email = response.kakao_account.email
        	  var id = response.id
        	  var userData =  new Object();
        	  userData.email = email;
        	  userData.id = id;
        	  
        	  console.log(response)
        	  alert("로그인 성공")
        	  $.ajax({
        			url:'http://localhost:8080/member/Member/InsertReg',
        			data:userData,
        			type:'POST',
        			success: function(result){
        				location.href = "InsertMember"
        			},
        			error:function(e){
        				console.log(e);
        			}
        	  })
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
    /* <<<<<<<<<<<<<<<<<<<<<<<google API>>>>>>>>>>>>>>>>>>>>>>>>>>> */
    
    /* function googleLogin(){
    	init();
    	
    	function init() {
    		gapi.load('auth2', function() {
    		gapi.auth2.init();
    		options = new gapi.auth2.SigninOptionsBuilder();
    		options.setPrompt('select_account');
            // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
    		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
            // 인스턴스의 함수 호출 - element에 로그인 기능 추가
            // GgCustomLogin은 a태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
    		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
    	})
    }

    function onSignIn(googleUser) {
    	var access_token = googleUser.getAuthResponse().access_token
    	$.ajax({
        	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
    		url: 'https://people.googleapis.com/v1/people/me'
            // key에 자신의 API 키를 넣습니다.
    		, data: {personFields:'birthdays', key:'AIzaSyD5yDAaRMcBoXYMckXOgDYx1dlRECv2SGY', 'access_token': access_token}
    		, method:'GET'
    	})
    	.done(function(e){
            //프로필을 가져온다.
    		var profile = googleUser.getBasicProfile();
    		console.log(profile)
    	})
    	.fail(function(e){
    		console.log(e);
    	})
    }

    function onSignInFailure(t){		
    	console.log(t);
    }
    } */
    
    /* <<<<<<<<<<<<<<<<<<<<<<<naver API>>>>>>>>>>>>>>>>>>>>>>>>>>> */
    
    /* function naverLogin(){
    	var naverLogin = new naver.LoginWithNaverId(
    			{
    				clientId: "dlhJ2g0mIoMEsX50tvIC", //내 애플리케이션 정보에 cliendId를 입력
    				callbackUrl: "http://localhost:8080/member/Member/InsertReg", // 내 애플리케이션 API설정의 Callback URL 을 입력
    				isPopup: false,
    				callbackHandle: true
    			}
    		);	

    	naverLogin.init();

    	window.addEventListener('load', function () {
    		naverLogin.getLoginStatus(function (status) {
    			if (status) {
    				var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    	    		
    				console.log(naverLogin.user); 
    	    		
    	            if( email == undefined || email == null) {
    					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
    					naverLogin.reprompt();
    					return;
    				}
    			} else {
    				console.log("callback 처리에 실패하였습니다.");
    			}
    		});
    	});
    	
    	
    } */
    
    
  </script>
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>

</head>
<body>

<table>
	<tr>
		<td><a href="InsertMember" >일반회원</a></td>
	</tr>
	<tr>
		<td><a href="InsertCorpMember">법인회원</a></td>
	</tr>
	<tr>
		<td><a href="/member/Main/Main">뒤로가기</a></td>
	</tr>
</table>
	
</body>
</html>