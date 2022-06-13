<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<div class="container">
        <main>
	        <div class="row border-dark border-bottom" style="margin-bottom:20px">
	        <h1>정보 수정</h1>
	   		 </div>
            <div class="row g-5">
                
				<jsp:include page="../sideMenu.jsp"/>

                <div class="col-md-7 col-lg-8">
                    <form class="needs-validation"  name="signUpForm" action="MemberEdit_Reg" method="post"
                        onsubmit="return authCheck();">
                        <div class="row g-3">
                            <div class="col-sm-9">
                                <label for="input_id" class="form-label">ID</label>
                                <input type="text" class="form-control" id="input_id" name="pid" value="${User.pid }"
                                    required readonly>
                            </div>
                        </div>
                        <div class="row" style="margin-top:20px">
                            <div class="col-sm-9" >
                                <label for="input_pw" class="form-label">Password</label>
                                <input type="password" class="form-control" id="input_pw" name="pw" 
                                    value="${User.pw }" required readonly>
                            </div>
                        </div>
                        <div class="row" style="margin-top:20px">
                            <div class="col-sm-9" >
                                <label for="input_name" class="form-label">사입자명</label>
                                <input type="text" class="form-control" id="input_name" name="pname" 
                                    value="${User.corp_name }" required readonly>
                            </div>
                        </div>
                        
                        <div class="row" style="margin-top:20px">
                            <div class="col-sm-9" >  
                                <label for="input_nickname" class="form-label">닉네임</label>
                                <input type="text" class="form-control" id="input_nickname" name="nick_name"
                                     value="${User.nick_name }" required>
                            </div>
                        </div>
                            
                        <div class="row" style="margin-top:20px">

                            <div class="col-sm-9" >
                                <label for="input_num" class="form-label">담당자전화번호</label>
                                <input type="text" class="form-control" id="input_num" name="phonenum" maxlength="11"
                                    placeholder="" value="${User.manager_num }" required>
                            </div>

                        </div>

                        <div class="row" style="margin-top:20px">
                            <div class="col-9">
                                <label for="inputEmailForm" class="form-label">이메일</label>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" id="inputEmailForm" name="email1"
                                        maxlength="30" placeholder="Username" aria-label="Username" value="${email }">
                                    <span class="input-group-text">@</span>
                                    <select class="form-select" id="selectEmailForm" name="email2">
                                        <option value="google.com" <c:if test="${email_address == \"google.com\" }"> selected</c:if>>google.com</option>
                                        <option value="naver.com" <c:if test="${email_address == \"naver.com\" }"> selected</c:if>>naver.com</option>
                                        <option value="nate.com" <c:if test="${email_address == \"nate.com\" }"> selected</c:if>>nate.com</option>
                                    </select>
                                </div>
                                <div class="invalid-feedback">
                                    이메일 인증이 필요합니다.
                                </div>
                            </div>

                        </div>

                        <div class="row" style="margin-top:20px">
                            <label for="address" class="form-label">주소</label>
                            <div class="col-3">
                                <input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호"
                                    value="" disabled>
                                <input type="text" class="form-control" id="extraAddress" name="extraAddress"
                                    placeholder="참고사항" value="" disabled>
                            </div>
                            <div class="col-6">
                                <input type="text" class="form-control" id="address" name="address" placeholder="주소"
                                    value="${User.address }" disabled>
                                <input type="text" class="form-control" id="detailAddress" name="detailAddress"
                                    placeholder="상세주소" value="" >
                            </div>

                            <div class="col-sm-3">
                                <button class="w-100 btn btn-lg btn-primary" onclick="on()" type="button"
                                    id="authCodeCheckBtn">우편번호 찾기</button>
                            </div>
                        </div>
                        <hr class="my-4">

                        <button class="w-100 btn btn-primary btn-lg" type="submit">정보수정 완료</button>
                    </form>
                </div>
            </div>
        </main>
    </div>
    
<!-- <form name="signUpForm" action="CorpMemberEdit_Reg" method="post"> -->
<!-- 	<table border=""> -->
<!-- 		<tr> -->
<!-- 			<th>아이디</th> -->
<%-- 			<td><input type="text" name="pid" value="${user_data.pid }" readOnly/></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>비밀번호</th> -->
<!-- 			<td> -->
<%-- 				<input type="password" name="pw" value="${user_data.pw }" readOnly /> --%>
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>닉네임</th> -->
<%-- 			<td><input type="text" name="nick_name" value="${user_data.nick_name }"/></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>회사명</th> -->
<%-- 			<td><input type="text" name="corp_name" value="${user_data.corp_name }"/></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>사업자등록번호</th> -->
<%-- 			<td><input type="text" name="corp_regnum" value="${user_data.corp_regnum }"/><button type="button" value="사업자 등록번호 확인" name="checkRegNum" onclick="corpRegNumCheck()">인증</button></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>회사주소</th> -->
<%-- 			<td><input type="text" name="corp_address" value="${user_data.corp_address }"/></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>주소</th> -->
<!-- 			<td> -->
<!-- 			<input type="text" name="postcode" id="postcode" placeholder="우편번호"> -->
<!--    			<input type="button" onclick="on()" value="우편번호 찾기"><br> -->
<%-- 		    <input type="text" name="address" id="address" value="${user_data.corp_address }" placeholder="주소"><br> --%>
<%-- 		    <input type="text" name="detailAddress" id="detailAddress" value="${user_data.detailAddress }" placeholder="상세주소"> --%>
<!-- 		    <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목"> -->
<!-- 		    </td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>담당자전화번호</th> -->
<%-- 			<td><input type="text" name="manager_num" value="${user_data.manager_num }"/></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>담당자이메일</th> -->
<!-- 			<td> -->
<%-- 				<input type="text" name="email1" id="inputEmailForm" value="${email }"/> --%>
<!-- 				<input type="text" style="width: 20px; border: none; background: transparent;" value="@" disabled />  -->
<!-- 				<select name="email2" id="selectEmailForm"> -->
<!-- 					<option value="gmail.com">google.com</option> -->
<!-- 					<option value="naver.com">naver.com</option> -->
<!-- 					<option value="nate.com">naver.com</option> -->
<!-- 				</select> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td colspan="2" align="right"><input type="submit" value="완료" /></td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- </form> -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
<script>

function on(){
	execDaumPostcode();
	
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	}
}

function authCheck(){
	var corpReg = document.getElementById("corpAuthPass").value;
	
	if(corpReg=="true" ){
		return true
	} else if(corpReg=="false"){
		alert("사업자 인증을 해주세요")
		return false;
	}
}

function corpRegNumCheck(){
    var inputRegNum = document.signUpForm.corp_regnum.value;
   //  console.log(inputRegNum);

    var data = {
    "b_no": [inputRegNum]
    }; 
    
    console.log(data)

    $.ajax({
      url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=TSCYgkMUJNavMzzHkbBTAvLHLaj1RrxOpBZ6BGHm49jIZIs%2FWtYi41K96uUEnIDmbtL7F7x900D14CVoDKpsNA%3D%3D",  // serviceKey 값을 xxxxxx에 입력
      type: "POST",
      data: JSON.stringify(data), // json 을 string으로 변환하여 전송
      dataType: "JSON",
      contentType: "application/json",
      accept: "application/json",
      success: function(result) {
    	  var b_stt = result.data[0].b_stt;
    	  
    	  if(b_stt=="" || b_stt=="폐업자" || b_stt=="휴업자"){
    		  alert("잘못된 등록번호 입니다.")
    	 	  document.getElementById("corpAuthPass").value = false;
    	  }else if(b_stt=="계속사업자"){
    		  alert("인증되었습니다.")
    	 	  document.getElementById("corpAuthPass").value = true;

    		  corpCheck = true;
    	  }else{
    		  alert("잘못된 등록번호 입니다.")
    	  }
    	  console.log(result)
          
      },
      error: function(result) {
          console.log(result.responseText); //responseText의 에러메세지 확인
      }
    });
 }
</script>
