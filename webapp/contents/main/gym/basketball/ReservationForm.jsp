<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 
<h1>예약 확인</h1>

<table border ="">
	<tr>
		<th>경기장</th>
		<td>${dto.sname }</td>
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
		<th>시간</th>
		<td>${dateSet }</td>
	</tr>
	<tr>
		<th>사용 시간</th>
		<td>
			<c:forEach var="time" items="${timeSelect }" varStatus="no">
			${time*2 }시~${(time+1)*2  }시 <br />
			</c:forEach>
		
			
		</td>
	</tr>
	<tr>
		<th>price</th>
		<td>${totalPrice }원</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${dto.location } <br />
		<a href="https://map.kakao.com/link/to/${dto.sname },33.450701,126.570667" style="color:blue" target="_blank">길찾기</a>
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
	IMP.init("imp36141974");
    function requestPay() {
    	
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: 'merchant_'+new Date().getTime(),
          name: "${dto.sname}",
//           amount: ${totalPrice},
          amount: 100,
          buyer_email: "${User.email}",
          buyer_name: "${User.pName}",
          buyer_tel: "${User.phoneNum}",
          buyer_addr: "${User.address}"
      }, function (rsp) { // callback
          if (rsp.success) {
              alert("결제 성공")
        			  
        	  var form = document.createElement('form');
              form.setAttribute('method', 'post');
              form.setAttribute('action', 'ReservationReg');
              document.charset = "UTF-8";
			 
			 var params = {
				 imp_uid : rsp.imp_uid,
				 id : '${dto.id}',
				 price : '${totalPrice}',
				 dateSet : '${dateSet}',
				 selectTime : '${timeSelect}',
				 user_id : '${User.pid}',
				 sname : '${dto.sname}',
				 manager_id : '${dto.manager_id}'
			 };
			 
              for (var key in params) {
                var hiddenField = document.createElement('input');
                hiddenField.setAttribute('type', 'hidden');
                hiddenField.setAttribute('name', key);
                hiddenField.setAttribute('value', params[key]);
                form.appendChild(hiddenField);
              }

              document.body.appendChild(form);
              form.submit();
            
          }
      });
    }
  </script>