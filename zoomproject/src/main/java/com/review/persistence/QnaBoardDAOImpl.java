package com.review.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.review.domain.Criteria;
import com.review.domain.QnaBoardVO;
import com.review.domain.SearchCriteria;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "com.review.mapper.QnaBoardMapper";

  @Override
  public void create(QnaBoardVO vo) throws Exception {
    session.insert(namespace + ".create", vo);
  }

  @Override
  public QnaBoardVO read(Integer no) throws Exception {
    return session.selectOne(namespace + ".read", no);
  }

  @Override
  public void update(QnaBoardVO vo) throws Exception {
    session.update(namespace + ".update", vo);
  }

  @Override
  public void delete(Integer no) throws Exception {
    session.delete(namespace + ".delete", no);
  }

  @Override
  public List<QnaBoardVO> listAll() throws Exception {
    return session.selectList(namespace + ".listAll");
  }

  @Override
  public List<QnaBoardVO> listPage(int page) throws Exception {

    if (page <= 0) {
      page = 1;
    }

    page = (page - 1) * 10;

    return session.selectList(namespace + ".listPage", page);
  }

  @Override
  public List<QnaBoardVO> listCriteria(Criteria cri) throws Exception {

    return session.selectList(namespace + ".listCriteria", cri);
  }

  @Override
  public int countPaging(Criteria cri) throws Exception {

    return session.selectOne(namespace + ".countPaging", cri);
  }

  @Override
  public List<QnaBoardVO> listSearch(SearchCriteria cri) throws Exception {

    return session.selectList(namespace + ".listSearch", cri);
  }

  @Override
  public int listSearchCount(SearchCriteria cri) throws Exception {

    return session.selectOne(namespace + ".listSearchCount", cri);
  }

  @Override
  public void updateReplyCnt(Integer no, int amount) throws Exception {

    Map<String, Object> paramMap = new HashMap<String, Object>();

    paramMap.put("no", no);
    paramMap.put("amount", amount);

    session.update(namespace + ".updateReplyCnt", paramMap);
  }

  @Override
  public void updateViewCnt(Integer no) throws Exception {
    
    session.update(namespace+".updateViewCnt", no);
    
  }


  @Override
  public void addfile(String name) throws Exception {
    
    session.insert(namespace+".addfile", name);
    
  }
  
  @Override
  public List<String> getfile(Integer no) throws Exception {
    
    return session.selectList(namespace +".getfile", no);
  }
 

  @Override
  public void deletefile(Integer no) throws Exception {

    session.delete(namespace+".deletefile", no);
    
  }

  @Override
  public void replacefile(String name, Integer no) throws Exception {
    
    Map<String, Object> paramMap = new HashMap<String, Object>();
    
   
    paramMap.put("name", name);
    paramMap.put("no", no);
    
    session.insert(namespace+".replacefile", paramMap);
    
  }

}
