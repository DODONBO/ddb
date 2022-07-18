<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리뷰 목록</title>
<Style type="text/css">
a{text-decoration: none; color: black;}
main{width : fit-content; margin :  60px auto;}
table {width : 750px; border-collapse: collapse; border-spacing: 0px;}
td.title{width: 550px;}
tr:first-of-type {border-top :  2px solid black; border-bottom : 0.5px solid gray; line-height: 40px;  font-size: 16px;}
tr{ border-bottom : 0.5px solid gray; line-height: 30px;  font-size: 12px;}
tr.dotted_border{ border-bottom : 0.5px dashed gray; }
tr:last-of-type{border-bottom :  2px solid black; }
td.center{text-align: center;}
td.contents{padding: 30px;}
.btn_wrap {width: fit-contentl; margin : 20px; text-align : right;}
</Style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
function deleteThis(e){
	if (!confirm('삭제하시겠습니까?')) return false;
	$.ajax({
		url : '/dr/review/delete/'+e,
		method : 'get',
		cacht : false,
		dataType : 'json',
		success : function(res){
			alert(res.deleted?'삭제성공':'삭제실패');
			location.href='/dr/review/list';
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
		<h3>리뷰 목록</h3>
		<table>
			<tr>
				<th style="width:60px;">번호</th>
				<th>제목</th>
				<th style="width:60px;">점수</th>
				<th style="width:120px;">작성일</th>
				<th style="width:100px;">작성자</th>
			</tr>
			<c:forEach var="b" items="${list}">
				<tr class="dotted_border">
					<td class="center">${b.board_num}</td>
					<td><a href="/dr/review/detail/${b.board_num}">${b.title}</a></td>
					<td  class="center">${b.score}</td>
					<td class="center">${b.wdate}</td>
					<td class="center">${b.writer}</td>
				</tr>
				<tr>
					<td class="img">
						<img src="${b.fpath}">
					</td>
					<td colspan="3" class="contents">${b.contents}</td>
					<td><button type="button" onclick="deleteThis(${b.board_num});">삭제</button></td>
				</tr>
			</c:forEach>
		</table>
		<div class="btn_wrap">
<button type="button" onclick="location.href='/dr/review/write';">작성</button>
</div>
	</main>
</body>
</html>