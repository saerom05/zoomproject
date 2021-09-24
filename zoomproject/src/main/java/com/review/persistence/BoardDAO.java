package com.review.persistence;

import java.util.List;

import com.review.domain.BoardVO;
import com.review.domain.Criteria;
import com.review.domain.SearchCriteria;

public interface BoardDAO {

	public void create(BoardVO vo) throws Exception;

	public BoardVO read(Integer no) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(Integer no) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	public List<BoardVO> listPage(int page) throws Exception;

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

	public List<BoardVO> listSearch(SearchCriteria cri)throws Exception;

	public int listSearchCount(SearchCriteria cri)throws Exception;

	public void updateReplyCnt(Integer no, int amount)throws Exception;

	public void updateViewCnt(Integer no)throws Exception;

	public void addfile(String name)throws Exception;

	public List<String> getfile(Integer no)throws Exception;  

	public void deletefile(Integer no)throws Exception;

	public void replacefile(String name, Integer no)throws Exception;

	public void updateRecCnt(Integer no)throws Exception;

}
