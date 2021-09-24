package com.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.Locale;

import org.apache.commons.codec.binary.Base64;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.review.domain.UserVO;
import com.review.service.UserService;

import net.sf.json.JSONObject;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	UserService us;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//info 정보 활용에 유용
		logger.info("Welcome home! The client locale is {}.", locale);

		return "home";
	}
	
	@RequestMapping(value = "/favicon.ico", method = RequestMethod.GET)
	public void favicon( HttpServletRequest request, HttpServletResponse reponse ) {
	try {
	  reponse.sendRedirect("/resources/favicon.ico");
	} catch (IOException e) {
	  e.printStackTrace();
	}
	}

	//회원가입 get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception
	{	
		logger.info("get signup");
	}

	//회원가입 post
	@RequestMapping(value = "/signup_action", method = RequestMethod.POST)
	public String signup_action(@ModelAttribute("searchVO") UserVO searchVO,HttpServletRequest request, RedirectAttributes redirect)
	{
		logger.info("post signup");

	    
	    try {
	        String encrypt = encryptPassword(searchVO.getUserPasswd().trim());
			searchVO.setUserPasswd(encrypt);
	        
	        us.insertMember(searchVO);
	        
	        redirect.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
	        
	    } catch (Exception e) {
	        
	        redirect.addFlashAttribute("msg", "오류가 발생되었습니다.");
	        
	    }
	    
	    return "redirect:/";
	}
	
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
	
	//ajax 컨트롤러
	@RequestMapping(value = "/getIdCnt", method = RequestMethod.POST)
	@ResponseBody
	public String loginCntReset(@RequestBody String filterJSON, 
				HttpServletResponse response, ModelMap medel) throws Exception{
		JSONObject resMap = new JSONObject();
	
	    try {
	        ObjectMapper mapper = new ObjectMapper();
	        UserVO searchVO = (UserVO) mapper.readValue(filterJSON, new TypeReference<UserVO>() {
	        });
	        		
	            int idCnt = us.getIdCnt(searchVO);
	            
	            resMap.put("res", "ok");
	            resMap.put("idCnt", idCnt);

		    	}	 
	        catch (Exception e) {
		        System.out.println(e.toString());
		        resMap.put("res", "error");
		    }
		    
		    response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    out.print(resMap);
	
		    return null;
	}

	//로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin() throws Exception
	{
		logger.info("get login");

		
		return "login";
	}

	//로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postSignin(
			@ModelAttribute("userVO") UserVO userVO, HttpServletRequest req,
			RedirectAttributes rttr, HttpServletResponse response) throws Exception
	{
		logger.info("post login");
        
		String encrypt = encryptPassword(userVO.getUserPasswd().trim());
		userVO.setUserPasswd(encrypt);

		UserVO login = us.login(userVO);
		HttpSession session = req.getSession();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();	
		
		if(login != null) {
			session.setAttribute("member", login); //member는 not null인 상태
		}
		else {
			//둘중 하나라도 틀리면 실행됨
			//세션값 제거
			session.setAttribute("member", null);
			//특정 페이지로 이동될 때 msg의 값을 false로 설정
//			rttr.addFlashAttribute("msg", false);
			//이때 특정 페이지는 리턴 값
			out.println("<script> alert('아이디 또는 비밀번호가 올바르지 않습니다.');");
			out.println("history.go(-1); </script>");
			out.close();
			return "login";
		}

	    return "redirect:/";

	}

	//myPage
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String getMyPage() throws Exception
	{
		logger.info("get MyPage");

		
		return "myPage";
	}
	
	@RequestMapping(value="/myPage", method = RequestMethod.POST)
	public String postMyPage(@ModelAttribute("userVO") UserVO userVO) throws Exception
	{
		logger.info("post MyPage");

		return "redirect:/myPageModify";
	}

	//myPage 수정
	@RequestMapping(value="/myPageModify", method = RequestMethod.GET)
	public String getMyPageModify() throws Exception
	{
		logger.info("get myPageModify");

		
		return "myPageModify";
	}
	
	//myPage 수정
	@RequestMapping(value="/update_myPage", method = RequestMethod.POST)
	public String postMyPageModify(@ModelAttribute UserVO userVO, Model model,
			HttpServletRequest req, HttpSession session, RedirectAttributes rttr) throws Exception
	{
		logger.info("post myPageModify");
			
		String encrypt = encryptPassword(userVO.getUserPasswd().trim());
		
		userVO.setUserPasswd(encrypt);
		us.update_myPage(userVO);
		UserVO u = us.login(userVO);
		 
		String uid = req.getParameter("userPasswd");//현재 세션의 패스워드 가지고 옴
		UserVO member = new UserVO(); //UserVO 객체 생성
		String encrypt2 = encryptPassword(uid.trim());
		member.setUserPasswd(encrypt2);//현재 세션의 패스워드를 다시 암호화해서 member 객체에 넣음
		
		if(member.getUserPasswd().equals(u.getUserPasswd())) {
			session.setAttribute("member", u);
		}
		
		return "redirect:/myPage";
	}

	//아이디 비밀번호 찾기
	@RequestMapping(value="/userSearch", method=RequestMethod.GET)
	public void getUserSearch()throws Exception
	{
		logger.info("get userSearch");
	}
	
	//아이디 찾기
	@RequestMapping(value = "/userIdSearch", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("userEmail") String userEmail,
			Model model)throws Exception
	{
		model.addAttribute("userId", us.find_id(response, userEmail));
		
		return "userIdFind";
	}
	
	//비밀번호 찾기(임시 비밀번호 발송)
	@RequestMapping(value = "/userPwdSearch", method = RequestMethod.POST)
	public String sendEmailAction (@RequestParam("userId") String userId, 
			@RequestParam("userEmail2") String userEmail, HttpServletResponse response) throws Exception {
		
		logger.info("post userPwdSearch");

		us.find_pwd(response, userId, userEmail);
		
        return "redirect:/login";
    }
	
	//로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception
	{
		logger.info("get logout");

		us.signout(session);

		return "redirect:/";
	}
	
	//회원탈퇴
	@RequestMapping(value="/memberDelete", method=RequestMethod.POST)
	public String memberDelete(@ModelAttribute UserVO userVO, HttpSession session, RedirectAttributes rttr) throws Exception
	{
		UserVO member = (UserVO)session.getAttribute("member");
		//세션 비밀번호 값
		logger.info(member.getUserPasswd());
		
		logger.info("memberDelete");

		if(passChk(member) > 0) {//세션에서의 userVO값을 passChk로 넘겨서 db에서 같은 아이디 비번 있으면 1출력
			us.memberDelete(member);
			session.invalidate();
		}
		
		return "redirect:/";
	}

	public int passChk(UserVO uv) throws Exception
	{
		int pwdChk = us.passChk(uv);
		return pwdChk;
	}

}
