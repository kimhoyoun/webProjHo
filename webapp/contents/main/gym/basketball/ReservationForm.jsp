<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c59b252c5ce6b362867c5d3da3e6369c&libraries=services"></script>
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  
<h1>예약 확인</h1>

<table border ="">
	<tr>
		<th>제목</th>
		<td>${dto.title }</td>
	</tr>
	<tr>
		<th>경기장 번호</th>
		<td>${dto.id }</td>
	</tr>
	<tr>
		<th>날짜</th>
		<td>${dateSet }</td>
	</tr>
	<tr>
		<th>price</th>
		<td>${totalPrice }원</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${dto.location } <br />
		<a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a>
		</td>
	</tr>
	<tr>
		<th>매니저</th>
		<td>${dto.manager_id }</td>
	</tr>

	<tr>
		<td colspan = "2">
			<a href="<c:url value="Detail?id=${dto.id }&page=${nowPage }&dateSet=${dateSet }"/>">취소</a>
			 <button onclick="requestPay()">결제하기</button>
		</td>
	</tr>

</table>

<script>
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp36141974"); // 예: imp00000000

    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "${dto.id}",
          name: "${dto.title}",
          amount: ${totalPrice},
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
              alert("결제 성공")
        	  location.href = "ReservationReg?imp_uid="+ rsp.imp_uid
          }
      });
    }
  </script>