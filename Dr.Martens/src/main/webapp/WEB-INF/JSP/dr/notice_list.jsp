<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공지사항 목록</title>
<Style type="text/css">
a{text-decoration: none; color: black;}
main{width : fit-content; margin :  60px auto;}
table {width : 750px; border-collapse: collapse; border-spacing: 0px;}
td.title{width: 550px;}
tr:first-of-type {border-bottom : 2px solid black; line-height: 40px;  font-size: 16px;}
tr{ border-bottom : 0.5px solid gray; line-height: 40px;  font-size: 12px;}
td.center{text-align: center;}
.btn_wrap {width: fit-contentl; margin : 20px; text-align : right;}
</Style>
</head>
<body>
<main>
		<h3>공지사항 목록</h3>
		<table>
			<tr>
				<th style="width:60px;">번호</th>
				<th>제목</th>
				<th style="width:120px;">작성일</th>
				<th style="width:60px;">조회수</th>
			</tr>
			<c:forEach var="b" items="${list}">
				<tr>
					<td class="center">${b.board_num}</td>
					<td><a href="/dr/notice/detail/${b.board_num}">[${b.category}] ${b.title}</a></td>
					<td class="center">${b.wdate}</td>
					<td class="center">${b.view_count}</td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="btn_wrap">
<button type="button" onclick="location.href='/dr/notice/write';">작성</button>
</div>
	</main>
</body>
</html>