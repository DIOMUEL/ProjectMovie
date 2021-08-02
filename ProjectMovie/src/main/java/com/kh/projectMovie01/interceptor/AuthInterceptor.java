package com.kh.projectMovie01.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.projectMovie01.vo.MemberVo;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();

		String uri = request.getRequestURI();
		String queryString = request.getQueryString();
		String requestPath = uri + "?" + queryString;
		//System.out.println("requestPath : " + requestPath);
		session.setAttribute("requestPath", requestPath);

		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");

		if(memberVo == null) {
			response.sendRedirect("/board/loginPage");
			return false;
		}
			return true;
	}
}
