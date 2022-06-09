<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>PostDetail</h2>

<table border="">
	<tr>
		<td colspan="2" align="right">
			<button onclick="location.href='PostDelete_Reg?post_id=${post_dto.post_id }&page=${nowPage }'">삭제</button>
			<button onclick="location.href='PostModify?post_id=${post_dto.post_id }&page=${nowPage }'">수정</button>
		</td>
	</tr>
	<tr>
		<td colspan="2">${post_dto.title }</td>
	</tr>
	<tr>
		<th>판매자 아이디</th>
		<td>${post_dto.user_id }</td>
	</tr>
	<tr>
		<th>판매자 이메일</th>
		<td>${post_dto.user_email }</td>
	</tr>
	<tr>
		<th>판매자 번호</th>
		<td>${post_dto.user_num }</td>
	</tr>
	<tr>
		<th>상품상태</th>
		<td>${post_dto.check_quality }</td>
	</tr>
	<tr>
		<th>카테고리</th>
		<td>${post_dto.l_category } > ${post_dto.s_category }</td>
	</tr>
	<tr>
		<th>상품가격</th>
		<td>${post_dto.price }</td>
	</tr>
	<tr>
		<th>거래방법</th>
		<td>${post_dto.delivery }</td>
	</tr>
	<tr>
		<td colspan="2">
			${post_dto.content }
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<textarea name="comment_input" id="" cols="90" rows="5" style="resize:none;"></textarea>
			<button onclick="commentInsert()">댓글입력</button>
			<input type="hidden" name="post_id" value="${post_dto.post_id }" />
		</td>
	</tr>
</table>
<table border="">
	<c:forEach var="dto" items="${comment_dto }" varStatus = "no">
	<tr>
		<td  rowspan="2">
		<textarea name="commentList" id="input_${dto.comment_id}" cols="80" rows="3" style="resize:none;" disabled>${dto.content}</textarea>
		</td>
		<td>${dto.comment_writer } <input type="hidden" id="writer_${dto.comment_id }" value="${dto.comment_writer }" /></td>
		<td><button name="commentEdit" idx_data="${dto.comment_id}" onclick="commentModify(this)">수정</button></td>
	</tr>
	<tr>
		<td>
			<fmt:formatDate value = "${dto.reg_date }" pattern="yy-MM-dd HH:mm"/>
			<input type="hidden" id="reg_date_${dto.comment_id }" value="${dto.reg_date }" />
		</td>
		<td>
			<button idx_data="${dto.comment_id}" onclick="commentDelete(this)">삭제</button>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="2"> <a href="PostList?page=${nowPage }">목록으로</a> </td>
	</tr>
</table>


<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
function commentInsert(){
	var urlComment = '<c:url value="/comment"/>'
	var comment = document.getElementsByName("comment_input")[0].value;
	location.href= urlComment+'/Insert?post_id=${post_dto.post_id }&page=${nowPage }&user_id=${post_dto.user_id}&comment='+comment;
}
function commentModify(me){
	var com_area = $('#input_'+$(me).attr('idx_data'))	
	var modifyUrl = '<c:url value="/comment/Modify"/>';
	
	if($(me).html()=='수정'){
		com_area.attr('disabled', false)
		$(me).html('완료');
	} else {
		com_area.attr('disabled', true)
		$(me).html('수정');

		var commentData =  new Object();
		commentData.comment_input = com_area.val();
		commentData.post_id = "${post_dto.post_id}";
		commentData.comment_id = $(me).attr('idx_data');
		commentData.writer = $('#writer_'+$(me).attr('idx_data')).val();
		commentData.reg_date = $('#reg_date_'+$(me).attr('idx_data')).val();
	        	  
		$.ajax({
			url: modifyUrl,
			data:commentData,
			type:'POST',
			success: function(result){
				alert("수정되었습니다.")
			},
			error:function(e){
				console.log(e);
			}
	  })
	}
}
function commentDelete(me){
	var deleteUrl = '<c:url value="/comment/Delete"/>';
	
	var commentData =  new Object();
		commentData.comment_id = $(me).attr('idx_data');
		
	        	  
		$.ajax({
			url: deleteUrl,
			data:commentData,
			type:'POST',
			success: function(result){
				
				location.reload();
				alert("삭제되었습니다.")
			},
			error:function(e){
				console.log(e);
			}
	  })
}

</script>