package com.review.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.review.domain.Criteria;
import com.review.domain.QnaReplyVO;

@Repository
public class QnaReplyDAOImpl implements QnaReplyDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "com.review.mapper.QnaReplyMapper";

  @Override
  public List<QnaReplyVO> list(Integer no) throws Exception {

    return session.selectList(namespace + ".list", no);
  }

  @Override
  public void create(QnaReplyVO vo) throws Exception {

    session.insert(namespace + ".create", vo);
  }

  @Override
  public void update(QnaReplyVO vo) throws Exception {

    session.update(namespace + ".update", vo);
  }

  @Override
  public void delete(Integer rno) throws Exception {

    session.update(namespace + ".delete", rno);
  }

  @Override
  public List<QnaReplyVO> listPage(Integer no, Criteria cri) throws Exception {

    Map<String, Object> paramMap = new HashMap<>();

    paramMap.put("no", no);
    paramMap.put("cri", cri);

    return session.selectList(namespace + ".listPage", paramMap);
  }

  @Override
  public int count(Integer no) throws Exception {

    return session.selectOne(namespace + ".count", no);

  }

  @Override
  public int getno(Integer rno) throws Exception {

    return session.selectOne(namespace + ".getno", rno);
  }
  
  
}
