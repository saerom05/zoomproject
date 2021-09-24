package com.review.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.review.domain.Criteria;
import com.review.domain.SearchCriteria;
import com.review.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.review.mapper.userMapper"; //userMapper를 namespace로 설정
	
	//회원가입
	@Override
	public int getIdCnt(UserVO searchVO) {
		return sqlSession.selectOne(Namespace+".getIdCnt", searchVO);
	}
	@Override
	public void insertMember(UserVO searchVO) {
		sqlSession.insert(Namespace+".insertMember", searchVO);
	}
	
	//로그인
	@Override
	public UserVO login(UserVO userVO) throws Exception{
		return sqlSession.selectOne(Namespace+".loginBcrypt", userVO);
	}
	
	@Override//회원정보 수정
	public int update_myPage(UserVO userVO) throws Exception
	{
		return sqlSession.update(Namespace+".update_myPage", userVO);
	}
	
	@Override//회원 탙퇴
	public void memberDelete(UserVO userVO) throws Exception
	{
		sqlSession.delete(Namespace+".memberDelete", userVO);
	}
	
	@Override//패스워드 확인
	public int passChk(UserVO userVO)  throws Exception
	{
		int result = sqlSession.selectOne(Namespace+".passChk", userVO);
		
		return result;
	}
	  
	  @Override//회원목록
	  public List<UserVO> listCriteria(Criteria cri) throws Exception {

	    return sqlSession.selectList(Namespace + ".listCriteria", cri);
	  }
	  @Override//회원목록
	  public List<UserVO> listSearch(SearchCriteria cri) throws Exception {

	    return sqlSession.selectList(Namespace + ".listSearch", cri);
	  }

	  @Override
	  public int listSearchCount(SearchCriteria cri) throws Exception {

	    return sqlSession.selectOne(Namespace + ".listSearchCount", cri);
	  }
	  
	@Override//아이디 찾기
	public String find_id(String userEmail) throws Exception
	{
		return sqlSession.selectOne(Namespace+".find_id", userEmail);
	}
	
	@Override//비밀번호 업데이트
	public int updatePw(String userPasswd, String  userId, String userEmail) throws Exception
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("userPasswd", userPasswd);
		paramMap.put("userId", userId);
		paramMap.put("userEmail", userEmail);
		
		return sqlSession.update(Namespace+".updatePwd", paramMap);
	}
	
}
