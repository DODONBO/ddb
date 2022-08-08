package com.ddbtft.demo.model;

import java.util.List;

import lombok.Data;

@Data
public class MatchInfo {
	long game_datetime;
	float game_length;
	String game_variation;
	String game_version;
	List <Participant> participants;
	int queue_id;
	int tft_set_number;
	String tft_game_type;
	String tft_set_core_name;
	String timeString;
}
