<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1:1질문 작성폼</title>
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
		url : '/dr/myqna/save',
		method : 'post',
		cache : false,
		data : serData,
		dataType : 'json',
		success : function(res){
			alert(res.saved ? '작성성공' : 'Failed');
			location.href='/dr/myqna/list';
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
<h3>1:1질문 작성</h3>
<form id="write_form" onsubmit="return save();">
<input type="hidden" name="pcode" value="0">
<div>
<label>카테고리</label>
	<select name="category" id="category">
		<option>주문관련</option>
		<option>배송관련</option>
		<option>교환/환불</option>
		<option>상품관련</option>
		<option>기타</option>
	</select>
	<label>map으로 상품번호/주문번호 넘겨받기</label>
	<input type ="hidden" name="product_code" id="product_code" value="1234">
	<input type="hidden" name="order_num" id="order_num" value="2022062801">
	<br>
	
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