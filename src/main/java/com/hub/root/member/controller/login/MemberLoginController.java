package com.hub.root.member.controller.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpCookie;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hub.root.member.service.login.MemberLoginService;

@Controller
@RequestMapping("member")
public class MemberLoginController {
	@Autowired MemberLoginService ms;

	@GetMapping("login")
	public String login(Model model, HttpSession session) {
		System.out.println("session : " + session);
		System.out.println("session : "+ session.getAttribute("userId"));
		model.addAttribute(session);
		return "member/login/login";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		System.out.println("memLoginCont logout 실행");
		session.invalidate();
		Cookie[] cookie  = req.getCookies();
		if (cookie != null) {
			for (Cookie c : cookie) {
				System.out.println("cookie : " + c.getName());
				if (c.getName().equals("myPage")) {
					c.setMaxAge(0);
					c.setPath("/root/member");
					res.addCookie(c);
					System.out.println("myPage : " + c.getValue());
				}
			}
		}
		return "redirect:/main/mainPage1";
	}
	@GetMapping("login/searchId")
	public String searchId() {
		
		return "member/login/searchId";
	}
	@GetMapping("login/searchPwd")
	public String searchPwd() {
		
		return "member/login/searchPwd";
	}
	
	@GetMapping("login/searchPwd/modifyPwd")
	public String modifyPwd(@RequestParam String id, Model model, 
			HttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println("id : " + id);
		Map<String, Object> map = new HashMap<String, Object>();
		
		Cookie[] cookies = req.getCookies();
		
		// 아이디와 쿠키값이 일치하면 1, 아니면 0값을 가진다.
		int result = ms.modifyPwdIdChk(id, cookies);
		
		
		return "member/login/modifyPwd";
	}

}
