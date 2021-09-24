package com.review.service;

import java.util.List;

import com.review.domain.Criteria;
import com.review.domain.QnaReplyVO;

public interface QnaReplyService {

  public void addReply(QnaReplyVO vo) throws Exception;

  public List<QnaReplyVO> listReply(Integer no) throws Exception;

  public void modifyReply(QnaReplyVO vo) throws Exception;

  public void removeReply(Integer rno) throws Exception;

  public List<QnaReplyVO> listReplyPage(Integer no, Criteria cri) 
      throws Exception;

  public int count(Integer no) throws Exception;
}
