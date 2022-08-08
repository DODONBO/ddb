package com.ddbtft.demo.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ddbtft.demo.model.LeagueEntry;
import com.ddbtft.demo.model.Match;
import com.ddbtft.demo.model.Player;
import com.ddbtft.demo.service.DDBTFTService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/tft")
public class DDBTFTController {

	@Autowired
	private DDBTFTService svc;
	
	@GetMapping("")
	public String index() {
		return "index";
	}

	@PostMapping("/player")
	public String getPlayer(@RequestParam("name") String name, Model model) {
		Player p = svc.getPlayerInfoByName(name);
		List <String> matchIDList = svc.getMatchList(p, 0, 5);
		List <Match> matchList = new ArrayList<>();
		for(int i=0; i<matchIDList.size(); i++) {
			Match m = svc.getMatchDetail(matchIDList.get(i));
			matchList.add(m);
		}
		LeagueEntry entry = svc.getRankBySId(p);
		model.addAttribute("entry", entry);
		model.addAttribute("player", p);
		model.addAttribute("matchList", matchList);
		return "playerDetail";
	}
	
	@GetMapping("/playerDetail")
	public String getPalyer2(@RequestParam("name") String name, Model model) {
		Player p = svc.getPlayerInfoByName(name);
		List <String> matchIDList = svc.getMatchList(p, 0, 5);
		List <Match> matchList = new ArrayList<>();
		for(int i=0; i<matchIDList.size(); i++) {
			Match m = svc.getMatchDetail(matchIDList.get(i));
			matchList.add(m);
		}
		LeagueEntry entry = svc.getRankBySId(p);
		model.addAttribute("entry", entry);
		model.addAttribute("player", p);
		model.addAttribute("matchList", matchList);
		return "playerDetail";
	}
	
	@GetMapping("/ranking")
	public String ranking(Model model) {
		int pageNum = 1;
		int pageSize = 5;
		PageHelper.startPage(pageNum, pageSize);
		List <LeagueEntry> list = svc.getRankList();
		Collections.sort(list, Collections.reverseOrder());
		PageInfo<LeagueEntry> pageInfo = new PageInfo<>(list);
//		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		return "ranking";
	}
	
	@GetMapping("/rec")
	public String rec() {
		return "rec";
	}
	
	@GetMapping("/item")
	public String item () {
		return "item";
	}
	
	@GetMapping("/ddb")
	public String ddb () {
		return "ddb";
	}
	
}
