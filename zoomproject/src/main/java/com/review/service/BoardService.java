package com.review.service;

import java.util.List;

import com.review.domain.BoardVO;
import com.review.domain.Criteria;
import com.review.domain.SearchCriteria;

public interface BoardService {

	public void regist(BoardVO board) throws Exception;

	public BoardVO read(Integer no) throws Exception;

	public void modify(BoardVO board) throws Exception;

	public void remove(Integer no) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCriteria(Criteria cri) throws Exception;

	public List<BoardVO> listSearchCriteria(SearchCriteria cri) 
			throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public List<String> getfile(Integer no)throws Exception;

	public void recommend(Integer no) throws Exception;
	
}
