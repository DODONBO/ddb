package com.ddbtft.demo.model;

import lombok.Data;

@Data
public class LeagueEntry implements Comparable<LeagueEntry> {
	String leagueId;
	String summonerId;
	String summonerName;
	String queueType;
	String ratedTier;
	int ratedRating;
	String tier;
	String rank;
	int leaguePoints;
	int wins;
	int losses;
	boolean hotStreak;
	boolean freshBlood;
	boolean veteran;
	boolean inactive;
	MiniSeries miniSeries;
	String tierStr;
	@Override
	public int compareTo(LeagueEntry l) {
		if (l.leaguePoints < leaguePoints) {
			return 1;
		} else if (l.leaguePoints > leaguePoints) {
			return -1;
		}
		return 0;
	}
}
