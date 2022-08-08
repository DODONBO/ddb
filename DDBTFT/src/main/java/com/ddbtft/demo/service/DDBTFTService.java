package com.ddbtft.demo.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.stereotype.Service;

import com.ddbtft.demo.key.TFTKey;
import com.ddbtft.demo.model.LeagueEntry;
import com.ddbtft.demo.model.LeagueList;
import com.ddbtft.demo.model.Match;
import com.ddbtft.demo.model.Player;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DDBTFTService {
	public Player getPlayerInfoByName(String name) {
		String reName = name.replace(" ", "%20");
		String reqURL = "https://kr.api.riotgames.com/tft/summoner/v1/summoners/by-name/"+reName+"?api_key="+TFTKey.key;
		ObjectMapper mapper = new ObjectMapper();
		Player p = null;
		
		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet getRequest = new HttpGet(reqURL);
			HttpResponse response = client.execute(getRequest);
			if (response.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);
				p = mapper.readValue(body, Player.class);
//				log.info("매치 리스트 ={}", matchList);
				return p;
			}}  catch (IOException e) {
				e.printStackTrace();
			}
		return null;
	}
	
	public Player getPlayerInfoByPuuid(String puuid) {
		String reqURL = "https://kr.api.riotgames.com/tft/summoner/v1/summoners/by-puuid/"+puuid+"?api_key="+TFTKey.key;
		ObjectMapper mapper = new ObjectMapper();
		Player p = null;
		
		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet getRequest = new HttpGet(reqURL);
			HttpResponse response = client.execute(getRequest);
			if (response.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);
				p = mapper.readValue(body, Player.class);
				return p;
			}}  catch (IOException e) {
				e.printStackTrace();
			}
		return null;
	}
	
	public List <String> getMatchList(Player p, int start, int count){
		String puuid = p.getPuuid();
		String reqURL = "https://asia.api.riotgames.com/tft/match/v1/matches/by-puuid/"+puuid+"/ids?start="+start+"&count="+count+"&api_key="+TFTKey.key;
		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet getRequest = new HttpGet(reqURL);
			HttpResponse response = client.execute(getRequest);
			if (response.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);
				String [] arr1 = body.split("\\[");
				String [] arr2 = arr1[1].split("\\]");
				String str = arr2[0].replace("\"", "");
				String [] arr3 = str.split(",");
				List <String> matchList = new ArrayList<>();
				for (int i = 0; i<arr3.length; i++) {
					matchList.add(arr3[i]);
				}
//				Map <String, Object > map = getMatchDetail(matchList.get(3));
//				map.put("matchList",matchList);
//				return map;
				return matchList;
			}}  catch (IOException e) {
				e.printStackTrace();
			}
		return null;
	}
	
	public Match getMatchDetail(String matchId) {
		String reqURL = "https://asia.api.riotgames.com/tft/match/v1/matches/"+matchId+"?api_key="+TFTKey.key;
		
		ObjectMapper mapper = new ObjectMapper();
		Match match = null;
	
		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet getRequest = new HttpGet(reqURL);
			HttpResponse response = client.execute(getRequest);
			if (response.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);
				match = mapper.readValue(body, Match.class);
//				System.out.println("메타 데이터 : " + match.toString());
//				List <Player> list = new ArrayList<>();
//				for(int i=0; i<8; i++) {
//					list.add(getPlayerInfoByPuuid(match.getInfo().getParticipants().get(i).getPuuid()));
//				}
//				Map <String, Object> map = new HashMap<>();
//				map.put("pList", list);
//				return map;
				for(int i=0; i<8; i++) {
//					log.info(getPlayerInfoByPuuid(match.getInfo().getParticipants().get(i).getPuuid()).getName());
					Player p =getPlayerInfoByPuuid(match.getInfo().getParticipants().get(i).getPuuid());
					match.getInfo().getParticipants().get(i).setName(p.getName());
					Collections.sort(match.getInfo().getParticipants().get(i).getTraits(), Collections.reverseOrder());
					match.getInfo().getParticipants().get(i).setProfileIconId(p.getProfileIconId());
					long time = (long) match.getInfo().getGame_length();
					match.getInfo().setTimeString(time/60+"분 "+time%60+"초");
//					log.info(p.getName());
				}
				return match;
			}}  catch (IOException e) {
				e.printStackTrace();
			}
		return null;
	}
	
	public LeagueEntry getRankBySId(Player p) {
		String reqURL = "https://kr.api.riotgames.com/tft/league/v1/entries/by-summoner/"+p.getId()+"?api_key="+TFTKey.key;
		
		ObjectMapper mapper = new ObjectMapper();
		LeagueEntry league = null;
	
		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet getRequest = new HttpGet(reqURL);
			HttpResponse response = client.execute(getRequest);
			if (response.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);
				String [] arr1 = body.split("\\[");
				String [] arr2 = arr1[1].split("\\]");
				String newBody = arr2[0];
				league = mapper.readValue(newBody, LeagueEntry.class);
				league.setTierStr(league.getTier() + " " + league.getRank() + " " + 
				league.getLeaguePoints() + "포인트" + "<br>" + league.getWins() + "승 " + league.getLosses() +"패<br>" +
						"승률 " + ((league.getWins()*100)/(league.getWins()+league.getLosses()))+"%");
				log.info(arr2[0]);
				return league;
			}}  catch (IOException e) {
				e.printStackTrace();
			}
		return null;
	}
	
	public List <LeagueEntry> getRankList(){
		String reqURL = "https://kr.api.riotgames.com/tft/league/v1/challenger"+"?api_key="+TFTKey.key;
		ObjectMapper mapper = new ObjectMapper();
		List <LeagueEntry> list = new ArrayList<>();
		LeagueList l = null;
		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet getRequest = new HttpGet(reqURL);
			HttpResponse response = client.execute(getRequest);
			if (response.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);
				l = mapper.readValue(body, LeagueList.class);
				list = l.getEntries();
				return list;
			}}  catch (IOException e) {
				e.printStackTrace();
			}
		return null;
	}
}
