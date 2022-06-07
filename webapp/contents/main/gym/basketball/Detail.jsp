<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <style>
 ul#resTime_list>li{
	 width:100px; 
	 border:solid 1px black; 
	 margin-right:5px; 
	 float:left;
	 background:#eee;
 }
 
 ul#resTime_list li.selected{
    background:red;   
  }  
  
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}
  
 </style>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', ()=>{
		
		var total = 0;
		const priceList = document.querySelectorAll('#resTime_list>li')
		var div = document.getElementById('pricediv')
		
		var timeInput = document.getElementById('timeSelect')
		
		var selectItemNum = 0
		
		var timeSelect = [];
		
		var selectedList = null;
		
		var date = '${param.dateSet}'
		var week = new Date(date).getDay();
		
		var weekly = 0
		var nighttime = 0
		
		if(week==0||week==6){
			weekly = ${dto.price_weekend_weekly}
			nighttime = ${dto.price_weekend_nighttime}
		}else{
			weekly = ${dto.price_weekday_weekly}
			nighttime = ${dto.price_weekday_nighttime}
		}
		
		var str = '${resData}'
		const arr = str.split(',')
		for(item of priceList){
			item.addEventListener('click', selectTime)
		}
		
		
		if(str.length >0){
			for(var i = 0; i<arr.length; i++){
				priceList[arr[i]].removeEventListener('click',selectTime)
				priceList[arr[i]].style.background = 'blue'
			}		
		}
		
		 function getIndex(checkList){
	            let selectedIndex = 0;
	            while((checkList=checkList.previousElementSibling) != null){
	              selectedIndex++
	            }

	            return selectedIndex
	          }
		
	 function selectTime(){
		
	          if(this.classList == ""){
	        	  if(selectItemNum<2){
		        	  this.classList.add('selected')
		        	  if(this.value == 1){
		 	       	  	total += weekly
		        	  }else{
		        		total += nighttime
		        	  }
		        	  if(selectItemNum == 0){
		        	  	timeSelect[0] = getIndex(this)
		        	  }else{
		        		timeSelect[1] = getIndex(this)
		        	  }
		        	  selectItemNum++
	        	  }else{
	        		  alert('최대 4시간까지 예약 가능합니다.')
	        	  }
	          }else{
	        	  this.classList.remove('selected')
	        	  if(this.value == 1){
	   	       	  	total -= weekly
	          	  }else{
	          		total -= nighttime
	          	  }
	        	  
	        	  for(let i = 0; i<timeSelect.length; i++){
	        		  if(timeSelect[i] == getIndex(this)){
	        			  timeSelect.splice(i,1);
	        			  i--;
	        		  }
	        	  }
	        	  selectItemNum--;
	          }
	        	  div.innerHTML = total+'원'+ '<input type="hidden" id = "totalPrice" name = "totalPrice" value="'+ total+'" />';
	        	  timeSelect.sort(function(a, b)  {
	        		  if(a > b) return 1;
	        		  if(a === b) return 0;
	        		  if(a < b) return -1;
	        		});
	        	  timeInput.setAttribute('value', timeSelect);	
	
	 }
	})
	
</script>
 
<h1>대관 상세</h1>

<c:set var = "totalPrice" value="100"/>

<form action="ReservationForm" method="post">
<input type="hidden" name = "id" value="${dto.id }" />

<table border ="">
	<tr>
		<th>제목</th>
		<td>${dto.title }</td>
	</tr>
	<tr>
		<th>이미지</th>
		<td>
			<c:forTokens items ="${dto.img }"
				delims = "," var = "ee" varStatus="no">
				<img src="<c:url value="/uploadFile/gym/basketball/${ee}"/>" alt="" />
			</c:forTokens>
			
		</td>
	</tr>
	<tr>
		<th>info</th>
		<td>${dto.contents_info }</td>
	</tr>
	<tr>
		<th>detail</th>
		<td>${dto.contents_detail }</td>
	</tr>
	<tr>
		<th>rule</th>
		<td>${dto.contents_rule }</td>
	</tr>
	<tr>
		<th>refund</th>
		<td>${dto.contents_refund }</td>
	</tr>
	<tr>
		<th>option</th>
		<td>샤워장 : ${dto.option1 }, 주차장 : ${dto.option2 }, 냉/난방시설 : ${dto.option3 }, 
		정수기 : ${dto.option4 }, 마루바닥 : ${dto.option5 }</td>
	</tr>
	<tr>
		<th>price</th>
		<td>평일 주간 : ${dto.price_weekday_weekly }원, 평일 야간 : ${dto.price_weekday_nighttime }원, <br />
		주말 주간 : ${dto.price_weekend_weekly }원, 주말 야간 : ${dto.price_weekend_nighttime }원</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${dto.location } <br />
		<a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a>
		<div id="map" style="width:500px;height:400px;"></div>
		<script>
			var lat = 0;
			var lng = 0;
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${dto.location}', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
					lat = result[0].y;
					lng = result[0].x;
					
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.title}</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});  
			
			function setCenter() {            
			    // 이동할 위도 경도 위치를 생성합니다 
			    var moveLatLon = new kakao.maps.LatLng(lat, lng);
			    
			    // 지도 중심을 이동 시킵니다
			    map.setCenter(moveLatLon);
			}

			function panTo() {
			    // 이동할 위도 경도 위치를 생성합니다 
			    var moveLatLon = new kakao.maps.LatLng(lat, lng)
			    
			    // 지도 중심을 부드럽게 이동시킵니다
			    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			    map.panTo(moveLatLon);            
			} 
			</script>
		</td>
	</tr>
	<tr>
		<th>매니저</th>
		<td>${dto.manager_id }</td>
	</tr>
	<tr>
		<td colspan = "2" >
			선택 날짜 :
			<input type="text" name="dateSet" id="dateSet" class="ts" autocomplete="off" value="${param.dateSet }"/>
			
			<script>
		
			var setDate=null;
			$(function(){
				$('#dateSet').datepicker({
					lang:'ko',
					dateFormat: 'yy-mm-dd',
					monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
			        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip
			        dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 텍스트
			        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], //달력의 요일 Tooltip
			        minDate:0,
			        maxDate:'+2M',
			        onSelect: function(dateText, inst){
			        	
			        	var arr = dateText.split("/")
			        	var date = arr[0]
			        	location.href="Detail?id=${dto.id }&page=${nowPage }&dateSet="+date;
			        }
				});
// 				var date = ${param.dateSet}
// 				if(date != null){
// 					$('#selectDate').datepicker('setDate', date);
// 				}else{
// 				$('#selectDate').datepicker('setDate', 'today');
// 				}
			})
	</script> 
		</td>
	</tr>
	<tr>
		<td colspan = "2" >
			<ul id ="resTime_list" style="list-style: none; ">
				<li value="0">00시 ~ 02시</li>
				<li value="0">02시 ~ 04시</li>
				<li value="0">04시 ~ 06시</li>
				<li value="1">06시 ~ 08시</li>
				<li  value="1">08시 ~ 10시</li>
				<li  value="1">10시 ~ 12시</li>
				<li value="1">12시 ~ 14시</li>
				<li value="1">14시 ~ 16시</li>
				<li  value="1">16시 ~ 18시</li>
				<li  value="0">18시 ~ 20시</li>
				<li  value="0">20시 ~ 22시</li>
				<li  value="0">22시 ~ 24시</li>
			</ul> 
			<input type="hidden" name = "timeSelect" id="timeSelect" />
			
		</td>
	</tr>
	<tr>
		<td colspan = "2" >
			가격 : <div id ="pricediv">0</div>
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<a href="List?page=${nowPage }">목록으로</a>
			<input type="submit"  value="예약하기"/>
		</td>
	</tr>
	<tr>
		<td colspan = "2">
			<a href="ModifyForm?id=${dto.id }&page=${nowPage}">수정</a>
			<a href="DeleteForm?id=${dto.id }&page=${nowPage}">삭제</a>
		</td>
	</tr>
</table>
</form>