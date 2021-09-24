package com.review.service;

import java.util.List;

import com.review.domain.Criteria;
import com.review.domain.ReplyVO;

public interface ReplyService {

	public void addReply(ReplyVO vo) throws Exception;

	public List<ReplyVO> listReply(Integer no) throws Exception;

	public void modifyReply(ReplyVO vo) throws Exception;

	public void removeReply(Integer rno) throws Exception;

	public List<ReplyVO> listReplyPage(Integer no, Criteria cri) 
			throws Exception;

	public int count(Integer no) throws Exception;

}
