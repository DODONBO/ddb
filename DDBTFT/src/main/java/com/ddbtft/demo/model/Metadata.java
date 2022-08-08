package com.ddbtft.demo.model;

import java.util.List;

import lombok.Data;

@Data
public class Metadata {
	String data_version;
	String match_id;
	List <String> participants;
}
