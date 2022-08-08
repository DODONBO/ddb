<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDB.GG</title>
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
<header id="header">
	<div class="inner">
		<div class="logo"> 
			<a href="/tft"><img src="/resources/img/logo.png" alt=""></a>
		</div>
        <ul id="gnb">
        	<li><a href="/tft/rec">추천 메타</a></li>
            <li><a href="/tft/item">아이템 통계</a></li>
            <li><a href="/tft/ranking">순위표</a></li>
            <li><a href="/tft/ddb">초밥집</a></li>
		</ul>
	</div>
</header>
<div id="main">
<div class="inner" style="padding : 200px 0; text-align: center;">
<a href="/tft"><img src="/resources/img/logo_white.png"></a>
<form method="post" action="/tft/player">
<input type="text" name="name">
<button type="submit">검색</button>
</form>
</div>
</div>
</body>
</html>