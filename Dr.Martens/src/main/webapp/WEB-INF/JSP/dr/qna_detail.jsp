<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자주묻는질문 상세보기</title>
<Style type="text/css">
main{width : fit-content; margin :  60px auto;}
table {width : 750px; border-collapse: collapse; border-spacing: 0px;}
td.title{width: 550px;}
tr:first-of-type {border-top :  2px solid black; border-bottom : 0.5px solid gray; line-height: 40px;}
tr:first-of-type>td.title{padding-left:40px; font-weight: bolder; font-size:20px;}
tr:last-of-type { border-bottom : 0.5px solid gray;}
tr:last-of-type>td{padding :  30px; color:#444;}
span{font-size:10px; color:#888;}
span.count{margin : 0 10px; font-size:16px; color:#888;}
.btn_wrap {width: fit-contentl; margin : 20px; text-align : right;}
</Style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
function deleteThis(){
	if (!confirm('삭제하시겠습니까?')) return false;
	$.ajax({
		url : '/dr/qa/delete/${board.board_num}',
		method : 'get',
		cacht : false,
		dataType : 'json',
		success : function(res){
			alert(res.deleted?'삭제성공':'삭제실패');
			location.href='/dr/qa/list';
		},
		error : function(xhr,status, err){
			alert(err);
		}
	});
	return false;
}
</script>
</head>
<body>
<main>
<h3>자주묻는질문 상세보기</h3>
<table>
<tr>
	<td class="title">[${board.category}] ${board.title}</td>
	<td>${board.wdate }</td>
</tr>
<tr>
	<td style="text-align : left; padding: 10px 30px; " colspan="2">조회수<span class="count"> | </span>${board.view_count }</td>
</tr>
<tr>
	<td colspan="2">${board.contents}</td>
</tr>
</table>
<div class="btn_wrap">
<button type="button" onclick="location.href='/dr/qa/list';">목록</button>
<button type="button" onclick="location.href='/dr/qa/edit/${board.board_num}';">수정</button>
<button type="button" onclick="deleteThis();">삭제</button>
</div>
</main>
</body>
</html>