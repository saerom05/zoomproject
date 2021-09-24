package com.review.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.review.domain.BoardVO;
import com.review.domain.Criteria;
import com.review.domain.SearchCriteria;
import com.review.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Transactional
	@Override
	public void regist(BoardVO board) throws Exception {

		dao.create(board);

		String[] files = board.getFiles();

		if(files == null) { return; } 

		for (String name : files) {
			dao.addfile(name);
		}   
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Integer no) throws Exception {
		dao.updateViewCnt(no);
		return dao.read(no);
	}

	@Transactional
	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);

		Integer no = board.getNo();
		
		dao.deletefile(no);

		String[] files = board.getFiles();

		if(files == null) { return; } 

		for (String name : files) {
			dao.replacefile(name, no);
		}
	}

	@Transactional
	@Override
	public void remove(Integer no) throws Exception {
		dao.deletefile(no);
		dao.delete(no);
	} 

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {

		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {

		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {

		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getfile(Integer no) throws Exception {

		return dao.getfile(no);
	} 

	@Override
	public void recommend(Integer no) throws Exception {

		dao.updateRecCnt(no);
	} 
	
}
