package com.review.persistence;

import java.util.List;

import com.review.domain.Criteria;
import com.review.domain.SearchCriteria;
import com.review.domain.UserVO;

public interface UserDAO {
	public int getIdCnt(UserVO searchVO);
	public void insertMember(UserVO searchVO);
	
	//로그인
	public UserVO login(UserVO userVO) throws Exception;

	//회원정보 수정
	public int update_myPage(UserVO userVO) throws Exception;
	
	//회원탈퇴
	public void memberDelete(UserVO userVO) throws Exception;
	
	//패스워드 확인
	public int passChk(UserVO userVO)  throws Exception;
	
	//회원목록
	public List<UserVO> listSearch(SearchCriteria cri) throws Exception;
	
	public List<UserVO> listCriteria(Criteria cri) throws Exception;
	
	//페이징
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	//아이디 찾기
	public String find_id(String userEmail) throws Exception;

	//비밀번호 업데이트
	public int updatePw(String userPasswd, String  userId, String userEmail) throws Exception;
}
