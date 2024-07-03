package com.hub.root.member.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/mainPage1";
	}
	@GetMapping("login/searchId")
	public String searchId() {
		
		return "member/login/searchId";
	}

}
