<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDB.GG::순위표</title>
<link rel="stylesheet" href="/resources/css/style.css"> </head>
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
	<div class="inner">
		<table id="table">
			<tr>
				<th style="width:6.25%; font-weight : bold;">순위</th>
				<th style="width:50%">소환사명</th>
				<th style="width:6.25%">티어</th>
				<th style="width:6.25%">포인트</th>
				<th style="width:6.25%">TOP4%</th>
				<th style="width:6.25%">게임수</th>
				<th style="width:6.25%">TOP4</th>
			</tr>
			<c:forEach var="l" items="${pageInfo.list}" varStatus="status">
			<c:if test="${ status.count <= 100}">
			<tr>
				<td style="text-align:center; font-weight : bold;">${status.count}</td>
				<td><a href="/tft/playerDetail?name=${l.summonerName}">${l.summonerName}</a></td>
				<td style="text-align:center;"><img src="https://cdn.lolchess.gg/images/lol/tier/2022/challenger.png" class="tier"></td>
				<td style="text-align:center;">${l.leaguePoints}</td>
				<c:set var="wins" value="${l.wins}"/>
				<c:set var="losses" value="${l.losses}"/>
								<%
					int wins = Integer.parseInt(pageContext.getAttribute("wins").toString());
					int losses = Integer.parseInt(pageContext.getAttribute("losses").toString());
					long winrate = (wins * 100)/(wins+losses);
					int total = wins +  losses;
					pageContext.setAttribute("winrate", winrate);
				%>
								<c:choose>
				<c:when test="${winrate >= 70}">
					<td style="text-align:center; color:#a32929; font-weight:bold;">${winrate}%</td>
				</c:when>
				<c:otherwise>
					<td style="text-align:center; font-weight:bold;">${winrate}%</td>
				</c:otherwise>
				</c:choose>
				<td style="text-align:center;"><%=total%></td>
				<td style="text-align:center;">${l.wins}</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>