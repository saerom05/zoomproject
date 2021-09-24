package com.review.persistence;

import java.util.List;

import com.review.domain.Criteria;
import com.review.domain.QnaBoardVO;
import com.review.domain.SearchCriteria;

public interface QnaBoardDAO {

  public void create(QnaBoardVO vo) throws Exception;

  public QnaBoardVO read(Integer no) throws Exception;

  public void update(QnaBoardVO vo) throws Exception;

  public void delete(Integer no) throws Exception;

  public List<QnaBoardVO> listAll() throws Exception;

  public List<QnaBoardVO> listPage(int page) throws Exception;

  public List<QnaBoardVO> listCriteria(Criteria cri) throws Exception;

  public int countPaging(Criteria cri) throws Exception;
  
  //use for dynamic sql
  
  public List<QnaBoardVO> listSearch(SearchCriteria cri)throws Exception;
  
  public int listSearchCount(SearchCriteria cri)throws Exception;
  
  
  public void updateReplyCnt(Integer no, int amount)throws Exception;
  
  
  public void updateViewCnt(Integer no)throws Exception;
  
  public void addfile(String name)throws Exception;
  
  public List<String> getfile(Integer no)throws Exception;  
   
  public void deletefile(Integer no)throws Exception;
  
  public void replacefile(String name, Integer no)throws Exception;
  
}
