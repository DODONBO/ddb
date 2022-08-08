package com.ddbtft.demo.model;

import lombok.Data;

@Data
public class Player {

	String id;
	String accountId;
	String puuid;
	String name;
	int profileIconId;
	long revisionDate;
	long summonerLevel;
	
}
