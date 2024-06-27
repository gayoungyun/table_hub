package com.hub.root.member.interceptor;

import java.io.PrintWriter;
import java.net.HttpCookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberInfoInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("interceptor 실행");
		Cookie[] cookies = request.getCookies();
		String cook = "";
		if (cookies != null) {
			for(Cookie c : cookies) {
				if (c.getName().equals("myPage")) {
					cook = c.getValue();
					break;
				}
			}
		}
		response.setContentType("text/html; charset=utf-8");
		if (cook == "") {
			PrintWriter out = response.getWriter();
			out.print("<script>location.href='/root/member/myPage/info';</script>");
			out.close();
			return false;
		} else {
			if (cookies != null) {
				for(Cookie c : cookies) {
					if (c.getName().equals("myPage")) {
						c.setMaxAge(5 * 60);
						response.addCookie(c);
						break;
					}
				}
			}
			return true;			
		}
		
		
	}

}
