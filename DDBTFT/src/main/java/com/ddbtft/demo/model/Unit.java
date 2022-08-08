package com.ddbtft.demo.model;

import java.util.List;

import lombok.Data;

@Data
public class Unit {

	List <Integer> items;
	List <String> itemNames;
	String character_id;
	String chosen;
	String name;
	int rarity;
	int tier;
	
}
