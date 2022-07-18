package com.drmarten.demo.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.drmarten.demo.vo.DRBoard;


@Mapper
public interface DRMapper {

	int saveNotice(DRBoard board);
	int saveQA(DRBoard board);
	int saveReview(DRBoard board);
	int saveMyQna(DRBoard board);
	List<DRBoard> getNoticeList();
	List<DRBoard> getQnaList();
	List<DRBoard> getReviewList();
	List<DRBoard> getMyQnaList();
	List<DRBoard> getQnaListByCategory(String category);
	List<DRBoard> searchQnaList(String search);
	DRBoard getMyQna(int num);
	DRBoard getNotice(int num);
	int deleteMyQna(int num);
	int deleteNotice(int num);
	int deleteQa(int num);
	int deleteReview(int num);
	int updateNotice(DRBoard board);
	DRBoard getQa(int num);
	int updateQa(DRBoard board);
	int updateMyQna(DRBoard board);
}
