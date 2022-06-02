<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>

	document.addEventListener('DOMContentLoaded', ()=>{
		const btn = document.querySelector('#btn')
		const product = "${pname}"
     	const price = document.querySelector('#price').innerText
		btn.addEventListener('click', requestPay)
		
		
		function requestPay() {
    	IMP.init('imp36141974');
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: 'merchant_'+new Date().getTime(),
          name: product,
          amount: Number(${price}),
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
    	  if ( rsp.success ) {
    		  var msg = '결제가 완료되었습니다.';
  			msg += '\n고유ID : ' + rsp.imp_uid;
  			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
  			msg += '\결제 금액 : ' + rsp.paid_amount;
  			msg += '카드 승인번호 : ' + rsp.apply_num;
  			
  			alert(msg);
    	    } else {
    	        var msg = '결제에 실패하였습니다.';
    	        msg += '에러내용 : ' + rsp.error_msg;
    	        
    	        alert(msg);
    	    }
      });
    }
	})



</script>

</head>

<body>
<h1>결제 </h1>

<p id = "productName">${pname }</p>
<p id = "price">${price }</p>

<button id = "btn">결제하기</button>

<script>
	
    
  </script>
</body>
</html>