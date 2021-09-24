package com.review.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.review.domain.UserVO;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	//Interceptor : 특정 경로 요청 컨트롤러에 접근하는 도중에 가로채서 그 전, 후에 실행되는 기능
	//로그인 여부 확인할 때 사용하면 좋음
	
	//컨트롤러 실행 전에 실행되는 preHandle > 컨트롤러가 실행되기 전에 관리자 여부를 확인하고 싶으니 이걸 사용
	//컨트롤러 실행 후에 실행되는 postHandle
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception
	{
		HttpSession session = req.getSession(); //현재 세션을 불러와 session에 저정
		UserVO member = (UserVO)session.getAttribute("member");
		//그 중 member라는 명칭의 세션을 불러와 UserVO 형태로 변환, UserVO 형태의 변수인 member에 저장 

		//로그인 하지 않았으면 로그인창으로 이동
		if(member == null) {
			res.sendRedirect("../signin");
			return false;
		}
		//member.getVerify 값이 9가 아닐 경우 실행
		if(member.getVerify() != 9)
		{
			res.sendRedirect("../");//처음 화면으로 되돌리는 역할
			return false;
		}
		return true;
	}
}
