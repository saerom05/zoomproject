package com.review.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.review.domain.Criteria;
import com.review.domain.QnaReplyVO;
import com.review.persistence.QnaBoardDAO;
import com.review.persistence.QnaReplyDAO;

@Service
public class QnaReplyServiceImpl implements QnaReplyService {

  @Inject
  private QnaReplyDAO replyDAO;
  
  @Inject
  private QnaBoardDAO boardDAO;

  @Transactional
  @Override
  public void addReply(QnaReplyVO vo) throws Exception {

    replyDAO.create(vo);
    boardDAO.updateReplyCnt(vo.getno(), 1);
  }
  
  @Transactional
  @Override
  public void removeReply(Integer rno) throws Exception {

    int no = replyDAO.getno(rno);
    replyDAO.delete(rno);
    boardDAO.updateReplyCnt(no, -1);
  }   



  @Override
  public List<QnaReplyVO> listReply(Integer no) throws Exception {

    return replyDAO.list(no);
  }

  @Override
  public void modifyReply(QnaReplyVO vo) throws Exception {

    replyDAO.update(vo);
  }



  @Override
  public List<QnaReplyVO> listReplyPage(Integer no, Criteria cri) 
      throws Exception {

    return replyDAO.listPage(no, cri);
  }

  @Override
  public int count(Integer no) throws Exception {

    return replyDAO.count(no);
  }

}
