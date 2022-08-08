package com.ddbtft.demo.model;

import java.util.List;

import lombok.Data;

@Data
public class Participant {
	Companion companion;
	int gold_left;
	int last_round;
	int level;
	int placement;
	int players_eliminated;
	int partner_group_id;
	String puuid;
	float time_eliminated;
	int total_damage_to_players;
	List<Trait> traits;
	List<Unit> units;
	List<String> augments;
	int profileIconId;
	String name;
}
