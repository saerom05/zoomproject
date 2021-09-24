package com.review.persistence;

import java.util.List;

import com.review.domain.Criteria;
import com.review.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> list(Integer no) throws Exception;

	public void create(ReplyVO vo) throws Exception;

	public void update(ReplyVO vo) throws Exception;

	public void delete(Integer rno) throws Exception;

	public List<ReplyVO> listPage(Integer no, Criteria cri) throws Exception;

	public int count(Integer no) throws Exception;

	public int getno(Integer rno) throws Exception;

}
