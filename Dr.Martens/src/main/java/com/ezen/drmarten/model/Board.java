package com.ezen.drmarten.model;

public class Board {

		private int board_num;
		private String category;
		private String title;
		private String contents;
		private java.sql.Date wdate;
		private String writer;
		private int score;
		private int product_code;
		private int order_num;
		private String fname;
		private String fpath;
		
		public String getFname() {
			return fname;
		}
		public void setFname(String fname) {
			this.fname = fname;
		}
		public String getFpath() {
			return fpath;
		}
		public void setFpath(String fpath) {
			this.fpath = fpath;
		}
		public int getBoard_num() {
			return board_num;
		}
		public void setBoard_num(int board_num) {
			this.board_num = board_num;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String cateogory) {
			this.category = cateogory;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContents() {
			return contents;
		}
		public void setContents(String contents) {
			this.contents = contents;
		}
		public java.sql.Date getWdate() {
			return wdate;
		}
		public void setWdate(java.sql.Date wdate) {
			this.wdate = wdate;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public int getScore() {
			return score;
		}
		public void setScore(int score) {
			this.score = score;
		}
		public int getProduct_code() {
			return product_code;
		}
		public void setProduct_code(int product_code) {
			this.product_code = product_code;
		}
		public int getOrder_num() {
			return order_num;
		}
		public void setOrder_num(int order_num) {
			this.order_num = order_num;
		}
		public int getView_count() {
			return view_count;
		}
		public void setView_count(int view_count) {
			this.view_count = view_count;
		}
		public int getPcode() {
			return pcode;
		}
		public void setPcode(int pcode) {
			this.pcode = pcode;
		}
		private int view_count;
		private int pcode;
}
