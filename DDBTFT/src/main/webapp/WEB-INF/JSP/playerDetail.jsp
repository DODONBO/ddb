<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*,java.util.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>DDB.GG::소환사 ${player.name}님의 정보</title>
            <link rel="stylesheet" href="/resources/css/style.css"> </head>
        <body>
            <header id="header">
                <div class="inner">
					<div class="logo"> <a href="/tft"><img src="/resources/img/logo.png" alt=""></a> </div>
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
                    <div class="player_info wrap">
                        <div class="icon"> <img src="http://ddragon.leagueoflegends.com/cdn/12.14.1/img/profileicon/${player.profileIconId}.png">
                            <div class="level">${player.summonerLevel}</div>
                        </div>
                        <div class="info wrap">
                            <div class="info_left">
                                <div class="name">${player.name}</div>
                                <div class="tier">${entry.tierStr}</div>
                                <div class="ref_btn">전적 갱신</div>
                            </div>
                            <div class="info_right"> </div>
                        </div>
                    </div>
                    <div class="match">
                        <div class="inner">
                            <div class="match_info">
                                <c:forEach var="m" items="${matchList}">
                                    <div class="match_detail wrap">
                                        <div class="summary">
                                            <div class="placement">
                                                <c:forEach var="p" items="${m.info.participants}">
                                                    <c:if test="${p.name eq player.name}"> <span class="placement_text">#${p.placement}</span> </c:if>
                                                </c:forEach>
                                            </div>
                                            <div class="gametype"> ${m.info.tft_game_type} </div>
                                            <div class="length"> ${m.info.timeString} </div>
                                            <div class="datetime">
                                                <c:set var="date" value="${m.info.game_datetime}" />
                                                <%
												long date = (Long)pageContext.getAttribute("date");
												SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY/MM/dd HH:mm:ss");
												Date date2 = new Date();
												date2.setTime(date);
												String dateString = simpleDateFormat.format(date2);
												pageContext.setAttribute("dateString", dateString);
											%>
                                                    <!--  ${dateString}-->
                                                    <%=dateString%>
                                                        <br> ${m.metadata.match_id} </div>
                                        </div>
                                        <div class="imgs">
                                            <div class="img_wrap match_profile"> <img src="https://cdn.lolchess.gg/assets/loadouts/companions/tooltip_grumpylion_icecream_tier3.png"> </div>
                                            <div class="trait_wrap">
                                                <c:forEach var="p" items="${m.info.participants}">
                                                    <c:choose>
                                                        <c:when test="${p.name eq player.name}">
                                                            <c:forEach var="trait" items="${p.traits}">
                                                                <c:choose>
                                                                    <c:when test="${trait.style != 0}">
                                                                        <div class="trait">
                                                                            <c:set var="grade" value="${trait.style}" />
                                                                            <%
                                        							int grade = Integer.parseInt(pageContext.getAttribute("grade").toString());
                                        							if(grade==1){
                                        								pageContext.setAttribute("grade","bronze");
                                        							} else if (grade==2){
                                        								pageContext.setAttribute("grade","silver");
                                        							} else if (grade==3){
                                        								pageContext.setAttribute("grade","gold");
                                        							} else if (grade==4){
                                        								pageContext.setAttribute("grade","chromatic");
                                        							}
                                        						%> <img src="https://cdn.lolchess.gg/images/tft/traits/background/${grade}.svg" class="trait_grade">
                                                                                <c:set var="tr" value="${trait.name}" />
                                                                                <%
                                        							String tr = (String)pageContext.getAttribute("tr");
                                        							String trimTrait = tr.substring(5).toLowerCase();
                                        							if(trimTrait.equals("dragon")) trimTrait = trimTrait+"s";
                                        							pageContext.setAttribute("trimTrait", trimTrait);
                                        						%> <img src="https://cdn.lolchess.gg/images/tft/traiticons-black/7.0/${trimTrait}.svg" class="trait_icon"> </div>
                                                                    </c:when>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="participant">
                                            <div class="wrap">
                                                <c:forEach var="p" items="${m.info.participants}">
                                                    <div class="name">
                                                        <div class="img_wrap"> <img src="http://ddragon.leagueoflegends.com/cdn/12.14.1/img/profileicon/${p.profileIconId}.png"></div>
                                                        <c:choose>
                                                            <c:when test="${p.name eq player.name}"> <a style="font-weight: bold; color : #03a8d8;" href="/tft/playerDetail?name=${p.name}">${p.name}</a> </c:when>
                                                            <c:otherwise> <a href="/tft/playerDetail?name=${p.name}">${p.name}</a> </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>