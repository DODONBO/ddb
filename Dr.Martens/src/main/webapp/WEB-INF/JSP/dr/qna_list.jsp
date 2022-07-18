<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 목록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$('.getdetail').on('click', function(){
		if($(this).next('.detail').hasClass('on')==false){
			$('.detail').removeClass('on');
			$('.getdetail').removeClass('on');
			$(this).addClass('on');
			$(this).next('.detail').addClass('on');
		}else {
			$(this).toggleClass('on');
			$(this).next('.detail').toggleClass('on');
		}
	});
});
$(function(){
	$('.category_btn').on('click', function(){
		var category = $(this).text();
		var str =  '/dr/qa/category/'+category;
		$('#table').load(location.href=str , '#table');
		$(this).addClass('on');
	});
});
</script>
<style type="text/css">
a{text-decoration : none; color : black;}
main{width : fit-content; margin : 50px auto;}
.category_btn{
	padding : 15px 20px; border-radius : 0px; border : 0.5px soldi #666;
	font-weight : bolder;
	line-height : 20px;
	background-color : #fcfcfc;
	margin : 5px 0;
	cursor: pointer;
}
.category_btn.on{
	color : #fff;
	background-color : black;
}
th.category{width : 200px;}
th.title{width : 550px;}
table{border-collapse: collapse; border-spacing: 0px; font-size : 12px;}
th{border-bottom : 2px solid black; line-height: 40px;}
tr{ line-height : 36px; border-bottom : 1px solid gray;}
td{padding-left : 10px;}
.getdetail{cursor: pointer; }
.getdetail.on{border-bottom:none;}
.detail{
display : none; 
background-color : #eee; font-size : 12px; line-height : 28px;}
.detail.on{display: table-row;}
.detail>td{padding : 30px;}
.search_wrap{width:700px; line-height: 40px;  border : 1px solid black; padding: 0 30px; margin-bottom:10px;}
#search{width : 650px; line-height: 38px; border: none; font-size:22px;}
#search:focus {outline : none;}
#search_btn{line-height: 40px; border: none; background-color: #fff; font-size : 22px;}
.pgn_wrap{margin : 30px auto; text-align: center;}
.pgn{display:inline-block; width : 34px; line-height:34px; border : 2px solid black; font-weight: bolder;
text-align: center; font-size : 20px; margin : 0 5px;}
.pgn_on{background-color: black; color : #fff;}
</style>
</head>
<body>
<main>
		<h1>자주 묻는 질문</h1>
		<form id="search_input" method="post" action="/dr/qa/search">
			<div class="search_wrap">
			<input type="text" value="" name="search" id="search" placeholder="검색어를 입력해주세요."><button type="submit" id="search_btn"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
		</form>
		<button class="category_btn on">전체</button>
		<button class="category_btn" >회원정보관련</button>
		<button class="category_btn">주문결제</button>
		<button class="category_btn" >배송안내</button>
		<button class="category_btn">주문취소</button><br>
		<button class="category_btn" >교환 • 반품 • 환불</button>
		<button class="category_btn" >상품관련</button>
		<button class="category_btn" >포인트 및 이벤트</button>
		<button class="category_btn" >기타</button>
		<button class="category_btn">AS</button>	
		<table id="table">
		<thead>
			<tr>
				<th class="category">문의유형</th>
				<th class="title">내용</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="b" items="${pageInfo.list}">
				<tr class="getdetail">
					<td>[${b.category}]</td>
					<td>[${b.category}] ${b.title}</td>
				</tr>
				<tr  class="detail">
					<td colspan="2">
					${b.contents}<br><br>
					<a href="/dr/qa/detail/${b.board_num }">상세보기</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="pgn_wrap">
		<c:forEach var="i" items="${pageInfo.navigatepageNums}">
				<c:choose>
					<c:when test="${i==pageInfo.pageNum}">
				<span class="pgn pgn_on">${i}</span>
			</c:when>
					<c:otherwise>
				<span class="pgn"><a href="/dr/qa/list/page/${i}">${i}</a></span>
			</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>
	</main>
</body>
</html>