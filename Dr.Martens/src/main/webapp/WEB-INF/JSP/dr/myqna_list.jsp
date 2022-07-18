<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1:1질문 목록</title>
<Style type="text/css">
a{text-decoration: none; color: black;}
main{width : fit-content; margin :  60px auto;}
table {width : 750px; border-collapse: collapse; border-spacing: 0px;}
td.title{width: 550px;}
tr:first-of-type {border-top :  2px solid black; border-bottom : 0.5px solid gray; line-height: 40px;  font-size: 16px;}
tr{ border-bottom : 0.5px solid gray; line-height: 30px;  font-size: 12px;}
tr:last-of-type{border-bottom :  2px solid black; }
td.num{text-align: center;}
.btn_wrap {width: fit-contentl; margin : 20px; text-align : right;}
</Style>
</head>
<body>
<main>
		<h3>1:1질문 목록</h3>
		<table id="List">
			<tr>
				<th style="width:60px;">번호</th>
				<th style="width:80px;">카테고리</th>
				<th>제목</th>
				<th style="width:100px;">작성자</th>
				<th style="width:120px;">작성일</th>
			</tr>
			<c:forEach var="b" items="${list}">
				<tr>
					<td class="num">${b.board_num}</td>
					<td>[${b.category}]</td>
					<td><a href="/dr/myqna/detail/${b.board_num}">${b.title}</a></td>
					<td>${b.writer}</td>
					<td>${b.wdate}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="btn_wrap">
		<button type="button" onclick="location.href='/dr/myqna/write';">작성</button>
		</div>
	</main>
</body>
</html>