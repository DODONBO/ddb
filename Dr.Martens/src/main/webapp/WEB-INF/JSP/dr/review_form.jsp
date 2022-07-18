<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
<style type="text/css">

	main{width : 350px; padding: 10px 10px 30px; margin : 50px auto;
	border : 1px solid black; border-radius: 10px; text-align : center;}
	textarea#title{width : 320px; height: 300px;}
	.btn_wrap{margin : 10px auto 0;}
	#preview-image{height:200px;}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview-image').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview-image').src = "";
	  }
	}
</script>
</head>
<body>
<main>
<h3>리뷰작성</h3>
<!-- 
function save(){
	var serData = $('#write_form').serialize();
	$.ajax({
		url : '/dr/review/save',
		method : 'post',
		cache : false,
		data : serData,
		processData: false, 
		contentType: false,
		dataType : 'json',
		success : function(res){
			alert(res.saved ? '작성성공' : 'Failed');
			location.href='/dr/review/list';
		},
		error : function(xhr, status, err){
			alert(err);
		}
	});
	return false;
} -->

<!-- <form id="write_form" onsubmit="return save();" enctype="multipart/form-data"> -->
<form id="write_form" action="/dr/review/save" method="post" enctype="multipart/form-data">
<div>
	<label>상품명(=제목)</label>
	<input type="text" name="title" id="title" value="상품명코드로받아올것">
</div>
<div>
	<label>내용</label>
	<textarea  name="contents" id="contents"></textarea>
</div>
<div class="image-container">
    <img  id="preview-image" src="https://dummyimage.com/300x300/ffffff/000000.png&text=preview+image">
    <input style="display: block;" type="file" id="input-image" name="files" onchange="readURL(this);">
</div>
 <div class="rating">
	<input type="range"  min="1" max="5" id="score" name="score">
	<div id="score_text"></div>
	<script>
	document.querySelector('#score').addEventListener('input', e=>{
		document.querySelector('#score_text').innerHTML = e.target.value;
		});
	</script>
</div>
<div class="btn_wrap">
<button type="reset">취소</button>
<button type="submit">저장</button>
</div>
</form>
</main>
</body>
</html>