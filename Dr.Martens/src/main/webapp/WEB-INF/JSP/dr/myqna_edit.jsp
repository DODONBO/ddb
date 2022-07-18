<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<style type="text/css">
	*{font-size :  14px; box-sizing: border-box;}
	h3{font-size: 20px;}
	main{width : 750px; margin : 50px auto;}
	label, select, input#title {line-height: 30px;}
	select{padding: 5px; border : none; width: 100px; text-align: center;}
	select:focus, input:focus, textarea:focus {outline: none;}
	input#title{width : 550px; border :  none; color: gray;}
	textarea{width : 750px; height: 300px; border: none; background-color: #eee}
	.btn_wrap{margin : 10px auto 0;}
	div.first{border-top : 2px solid black; border-bottom : 2px solid black; padding : 0 10px;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
function save(){
	var serData = $('#write_form').serialize();
	$.ajax({
		url : '/dr/myqna/update',
		method : 'post',
		cache : false,
		data : serData,
		dataType : 'json',
		success : function(res){
			alert(res.updated ? '수정성공' : 'Failed');
			location.href='/dr/myqna/detail/${board.board_num}';
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
<h3>공지 수정</h3>
<form id="write_form" onsubmit="return save();">
<input type="hidden" name="num" value="${board.board_num}">
<div class="first">
<label>분류</label>
	${board.category}
	<label class="title_label">제목</label>
	<input type="text" name="title" id="title" value="${board.title }">
</div>
<div class="second">
	<label>내용</label><br>
	<textarea  name="contents" id="contents" >${board.contents }</textarea>
</div>
<div class="btn_wrap">
<button type="reset">취소</button>
<button type="submit">저장</button>
</div>
</form>
</main>
</body>
</html>