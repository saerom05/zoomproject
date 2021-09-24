package com.review.service;

import java.util.List;

import com.review.domain.Criteria;
import com.review.domain.QnaBoardVO;
import com.review.domain.SearchCriteria;

public interface QnaBoardService {

  public void regist(QnaBoardVO board) throws Exception;

  public QnaBoardVO read(Integer no) throws Exception;

  public void modify(QnaBoardVO board) throws Exception;

  public void remove(Integer no) throws Exception;

  public List<QnaBoardVO> listAll() throws Exception;

  public List<QnaBoardVO> listCriteria(Criteria cri) throws Exception;

  public int listCountCriteria(Criteria cri) throws Exception;

  public List<QnaBoardVO> listSearchCriteria(SearchCriteria cri) 
      throws Exception;

  public int listSearchCount(SearchCriteria cri) throws Exception;
  
  
  public List<String> getfile(Integer no)throws Exception;
  

}
