package com.review.persistence;

import java.util.List;

import com.review.domain.Criteria;
import com.review.domain.QnaReplyVO;

public interface QnaReplyDAO {

  public List<QnaReplyVO> list(Integer no) throws Exception;

  public void create(QnaReplyVO vo) throws Exception;

  public void update(QnaReplyVO vo) throws Exception;

  public void delete(Integer rno) throws Exception;

  public List<QnaReplyVO> listPage(Integer no, Criteria cri) throws Exception;

  public int count(Integer no) throws Exception;

  public int getno(Integer rno) throws Exception;

}
