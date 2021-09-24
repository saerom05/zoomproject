package com.review.service;

import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.review.persistence.UserDAO;
import com.review.domain.Criteria;
import com.review.domain.SearchCriteria;
import com.review.domain.UserVO;

@Service
public class UserServiceImpl implements UserService{


	//의존관계 주입, @DAO
	@Inject
	private UserDAO dao;
	
	@Autowired
    protected JavaMailSender  mailSender;

	
	
	public void setMailSender(JavaMailSender mailSender) {
	    this.mailSender = mailSender;
	  }

	
	@Override
	public int getIdCnt(UserVO searchVO) {
		return dao.getIdCnt(searchVO);
	}
	@Override
	public void insertMember(UserVO searchVO) {
		dao.insertMember(searchVO);
	}

	@Override//로그인
	public UserVO login(UserVO userVO) throws Exception
	{
		return dao.login(userVO);
	}
	
	
	@Override//로그아웃
	public void signout(HttpSession session) throws Exception
	{
		session.invalidate();
	}
	
	@Override//회원정보 수정
	public int update_myPage(UserVO userVO) throws Exception
	{
		return dao.update_myPage(userVO);
	}
	
	@Override//회원탈퇴
	public void memberDelete(UserVO userVO) throws Exception
	{
		dao.memberDelete(userVO);
	}

	@Override//패스워드 체크
	public int passChk(UserVO userVO)  throws Exception
	{
		int result =  dao.passChk(userVO);
		
		return result;
	}
	
	//회원목록
	  @Override
	  public List<UserVO> listSearchCriteria(SearchCriteria cri) throws Exception {

	    return dao.listSearch(cri);
	  }
	  
	  @Override
	  public List<UserVO> listCriteria(Criteria cri) throws Exception {

	    return dao.listCriteria(cri);
	  }

	@Override//페이징
	public int listSearchCount(SearchCriteria cri) throws Exception {

	    return dao.listSearchCount(cri);
	}
	
	
	@Override//아이디 찾기
	public String find_id(HttpServletResponse response, String userEmail) throws Exception
	{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.find_id(userEmail);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
	//암호화
	public static String encryptPassword(String data) throws Exception {

	    if (data == null) {
	        return "";
	    }

	    byte[] plainText = null; // 평문
	    byte[] hashValue = null; // 해쉬값
	    plainText = data.getBytes();

	    MessageDigest md = MessageDigest.getInstance("SHA-256");
	    hashValue = md.digest(plainText);

	    return new String(Base64.encodeBase64(hashValue));
	}
	
	
	@Override//비밀번호 찾기
	public void find_pwd(HttpServletResponse response, String userId, String userEmail) throws Exception
	{
		String pw = "";
		for (int i = 0; i < 6; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.find_id(userEmail);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		else {
			MimeMessage message = mailSender.createMimeMessage();

			 message.setSubject("[찾아ZOOM] 임시 비밀번호가 발급되었습니다", "UTF-8");
		      String htmlContent = "안녕하세요 "+ userId + "님<br><br>"
		     + "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p><br>"
			 + "<p>임시로 발급 드린 비밀번호는 <strong>" + pw + "</strong> 입니다.</p><br>"
			 + "<p>로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p>";
		      
		    try {
		    	  message.setText(htmlContent, "UTF-8", "html");
			      message.setFrom(new InternetAddress("dpwn9701@gmail.com"));
			      message.addRecipient(RecipientType.TO, new InternetAddress(userEmail));
			    
			    String encrypt = encryptPassword(pw.trim());
		
			    dao.updatePw(encrypt, userId, userEmail);
		      mailSender.send(message);
		      
		    } catch (MailException e) {
		      e.printStackTrace();
		    }
		}
	}
}
