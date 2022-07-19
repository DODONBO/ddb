package com.ezen.drmarten.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.drmarten.mappers.BoardMapper;
import com.ezen.drmarten.model.Board;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/dr")
public class BoardController {

	@Autowired
	private BoardMapper dao;

	@GetMapping("")
	public String index() {
		return "dr/index";
	}

	// 공지사항
	@GetMapping("/notice/write")
	public String notice_form() {
		return "dr/notice_form";
	}

	@GetMapping("/notice/list")
	public String notice_list(Model model) {
		List<Board> list = dao.getNoticeList();
		model.addAttribute("list", list);
		return "dr/notice_list";
	}

	@GetMapping("/notice/detail/{num}")
	public String notice_detail(@PathVariable("num") int num, Model model) {
		Board board = dao.getNotice(num);
		model.addAttribute("board", board);
		return "dr/notice_detail";
	}

	@PostMapping("/notice/save")
	@ResponseBody
	public Map<String, Object> notice_save(@RequestParam("category") String category,
			@RequestParam("title") String title, @RequestParam("contents") String contents) {
		Board board = new Board();
		board.setCategory(category);
		board.setTitle(title);
		board.setContents(contents);
		boolean saved = dao.saveNotice(board) > 0;
		Map<String, Object> map = new HashMap<>();
		map.put("saved", saved);
		return map;
	}
	
	@GetMapping("/notice/delete/{num}")
	@ResponseBody
	public Map<String, Object>notice_delete(@PathVariable("num") int num) {
		boolean deleted = dao.deleteNotice(num)>0;
		Map<String, Object> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}
	
	
	@GetMapping("/notice/edit/{num}")
	public String notice_edit_form(@PathVariable("num")int num, Model model) {
		Board board = dao.getNotice(num);
		model.addAttribute("board", board);
		return "dr/notice_edit";
	}
	
	@PostMapping("/notice/update")
	@ResponseBody
	public Map <String, Object> notice_udpate(
			@RequestParam("num")int num,
			@RequestParam("category") String category,
			@RequestParam("title")String title,
			@RequestParam("contents")String contents
			){
		Board board = new Board();
		board.setBoard_num(num);
		board.setCategory(category);
		board.setTitle(title);
		board.setContents(contents);
		boolean saved = dao.updateNotice(board) > 0;
		Map<String, Object> map = new HashMap<>();
		map.put("updated", saved);
		return map;
	}
	

	// 자주묻는질문
	@GetMapping("/qa/write")
	public String qa_form() {
		return "dr/qna_form";
	}

	@GetMapping("/qa/list")
	public String qa_list(Model model) {
		int pageNum = 1;
		int pageSize = 5;
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<Board> pageInfo = new PageInfo<>(dao.getQnaList());
		List<Board> list = pageInfo.getList();
		model.addAttribute("pageInfo", pageInfo);
		return "dr/qna_list";
	}

	@GetMapping("/qa/list/page/{page}")
	public String qa_listByPage(@PathVariable("page") int page, Model model) {
		int pageNum = page;
		int pageSize = 5;
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<Board> pageInfo = new PageInfo<>(dao.getQnaList());
		List<Board> list = pageInfo.getList();
		model.addAttribute("pageInfo", pageInfo);
		return "dr/qna_list";
	}

	@GetMapping("/qa/category/{category}")
	public String qa_listByCategory(@PathVariable("category") String category, Model model) {
		int pageNum = 1;
		int pageSize = 5;
		PageHelper.startPage(pageNum, pageSize);
		if (category.equals("전체")) {
			PageInfo<Board> pageInfo = new PageInfo<>(dao.getQnaList());
			List<Board> list = pageInfo.getList();
			model.addAttribute("pageInfo", pageInfo);
		} else {
			PageInfo<Board> pageInfo = new PageInfo<>(dao.getQnaListByCategory(category));
			List<Board> list = pageInfo.getList();
			model.addAttribute("pageInfo", pageInfo);
		}
		return "dr/qna_list";
	}

	@PostMapping("/qa/save")
	@ResponseBody
	public Map<String, Object> qa_save(@RequestParam("category") String category, @RequestParam("title") String title,
			@RequestParam("contents") String contents) {
		Board board = new Board();
		board.setCategory(category);
		board.setTitle(title);
		board.setContents(contents);
		boolean saved = dao.saveQA(board) > 0;
		Map<String, Object> map = new HashMap<>();
		map.put("saved", saved);
		return map;
	}

	@PostMapping("/qa/search")
	public String qa_search(@RequestParam("search") String search,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "psize", defaultValue = "8") int pageSize, Model model) {
		PageHelper.startPage(page, pageSize);
		PageInfo<Board> pageInfo = new PageInfo<>(dao.searchQnaList(search));
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("search", search);
		return "dr/qna_list";
	}
	@GetMapping("/qa/detail/{num}")
	public String qa_detail(@PathVariable("num") int num, Model model) {
		Board board = dao.getQa(num);
		model.addAttribute("board", board);
		return "dr/qna_detail";
	}
	
	@GetMapping("/qa/delete/{num}")
	@ResponseBody
	public Map<String, Object> qa_delete(@PathVariable("num") int num) {
		boolean deleted = dao.deleteQa(num)>0;
		Map<String, Object> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}

	@GetMapping("/qa/edit/{num}")
	public String qa_edit_form(@PathVariable("num")int num, Model model) {
		Board board = dao.getQa(num);
		model.addAttribute("board", board);
		return "dr/qna_edit";
	}
	
	@PostMapping("/qa/update")
	@ResponseBody
	public Map <String, Object> qa_udpate(
			@RequestParam("num")int num,
			@RequestParam("category") String category,
			@RequestParam("title")String title,
			@RequestParam("contents")String contents
			){
		Board board = new Board();
		board.setBoard_num(num);
		board.setCategory(category);
		board.setTitle(title);
		board.setContents(contents);
		boolean saved = dao.updateQa(board) > 0;
		Map<String, Object> map = new HashMap<>();
		map.put("updated", saved);
		return map;
	}
	
	// 리뷰
	@GetMapping("/review/write")
	public String review_form() {
		return "dr/review_form";
	}

	@GetMapping("/review/list")
	public String review_list(Model model) {
		List<Board> list = dao.getReviewList();
		model.addAttribute("list", list);
		return "dr/review_list";
	}

	@PostMapping("/review/save")
	public  String review_save(
			@RequestParam("files") MultipartFile mfiles, HttpServletRequest request,
			@RequestParam("title") String title,
			@RequestParam("contents") String contents, 
			@RequestParam("score") int score) {
		ServletContext context = request.getServletContext();
		String savePath = context.getRealPath("../resources");
		
		Board board = new Board();
		board.setFpath(savePath);
		
		String pName = mfiles.getOriginalFilename();
		String[] token = pName.split("\\.");
		String changed_pName = System.nanoTime() + "." + token[1];
		board.setFname(changed_pName);
		board.setTitle(title);
		board.setContents(contents);
		board.setScore(score);
		try {
			mfiles.transferTo(new File(savePath + "/" + changed_pName));
		} catch (Exception e) {
			e.printStackTrace();
		}
//		boolean saved = dao.saveReview(board) > 0;
//		Map<String, Object> map = new HashMap<>();
//		map.put("saved", saved);
		return "redirect:/dr/review/list";
	}
	
	@GetMapping("/review/delete/{num}")
	@ResponseBody
	public Map<String, Object> review_delete(@PathVariable("num") int num) {
		boolean deleted = dao.deleteReview(num)>0;
		Map<String, Object> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}

	// 1:1질문
	@GetMapping("/myqna/write")
	public String myqna_form() {
		return "dr/myqna_form";
	}

	@GetMapping("/myqna/list")
	public String myqna_list(Model model) {
		List<Board> list = dao.getMyQnaList();
		model.addAttribute("list", list);
		return "dr/myqna_list";
	}

	@PostMapping("/myqna/save")
	@ResponseBody
	public Map<String, Object> myqna_save(@RequestParam("title") String title,
			@RequestParam("contents") String contents, @RequestParam("category") String category,
			@RequestParam("pcode") int pcode, @RequestParam("product_code") String str_product_code,
			@RequestParam("order_num") String str_order_num) {
		Board board = new Board();
		board.setTitle(title);
		board.setContents(contents);
		board.setCategory(category);
		board.setPcode(pcode);
		if (str_product_code != null)
			board.setProduct_code(Integer.parseInt(str_product_code));
		if (str_order_num != null)
			board.setOrder_num(Integer.parseInt(str_order_num));

		boolean saved = dao.saveMyQna(board) > 0;
		Map<String, Object> map = new HashMap<>();
		map.put("saved", saved);
		return map;
	}

	@GetMapping("/myqna/detail/{num}")
	public String myqna_detail(@PathVariable("num") int num, Model model) {
		Board board = dao.getMyQna(num);
		model.addAttribute("board", board);
		return "dr/myqna_detail";
	}

	@GetMapping("/myqna/delete/{num}")
	@ResponseBody
	public Map<String, Object> myqna_delete(@PathVariable("num") int num) {
		boolean deleted = dao.deleteMyQna(num)>0;
		Map<String, Object> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}
	
	@GetMapping("/myqna/edit/{num}")
	public String myqna_edit_form(@PathVariable("num")int num, Model model) {
		Board board = dao.getMyQna(num);
		model.addAttribute("board", board);
		return "dr/myqna_edit";
	}
	
	@PostMapping("/myqna/update")
	@ResponseBody
	public Map <String, Object> myqna_udpate(
			@RequestParam("num")int num,
			@RequestParam("title")String title,
			@RequestParam("contents")String contents
			){
		Board board = new Board();
		board.setBoard_num(num);
		board.setTitle(title);
		board.setContents(contents);
		boolean saved = dao.updateMyQna(board) > 0;
		Map<String, Object> map = new HashMap<>();
		map.put("updated", saved);
		return map;
	}
}
