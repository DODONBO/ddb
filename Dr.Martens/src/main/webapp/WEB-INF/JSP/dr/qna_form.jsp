<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 작성폼</title>
<style type="text/css">

	main{width : 350px; padding: 10px 10px 30px; margin : 50px auto;
	border : 1px solid black; border-radius: 10px; text-align : center;}
	textarea#title{width : 320px; height: 300px;}
	.btn_wrap{margin : 10px auto 0;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
function save(){
	var serData = $('#write_form').serialize();
	$.ajax({
		url : '/dr/qa/save',
		method : 'post',
		cache : false,
		data : serData,
		dataType : 'json',
		success : function(res){
			alert(res.saved ? '작성성공' : 'Failed');
			location.href='/dr/qa/list';
		},
		error : function(xhr, status, err){
			alert(err);
		}
	});
	return false;
}
</script>
</head>
<body>
<main>
<h3>공지 작성</h3>
<form id="write_form" onsubmit="return save();">

<div>
<label>분류</label>
	<select name="category" id="category">
		<option>회원정보관련</option>
		<option>주문결제</option>
		<option>배송안내</option>
		<option>주문취소</option>
		<option value="교환•반품•환불">교환/반품/환불</option>
		<option>상품관련</option>
		<option>포인트 및 이벤트</option>
		<option>기타</option>
		<option VALUE="AS">A/S</option>
	</select>
	<label>제목</label>
	<input type="text" name="title" id="title" >
</div>
<div>
	<label>내용</label>
	<textarea  name="contents" id="contents"></textarea>
</div>
<div class="btn_wrap">
<button type="reset">취소</button>
<button type="submit">저장</button>
</div>
</form>
</main>
</body>
</html>