package com.ddbtft.demo.model;

import java.util.List;

import lombok.Data;

@Data
public class LeagueList {
	String leagueId;
	List <LeagueEntry> entries;
	String tier;
	String name;
	String queue;
}
