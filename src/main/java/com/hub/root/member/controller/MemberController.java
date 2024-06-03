package com.hub.root.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hub.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired MemberService ms;

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
		return "redirect:/";
	}
	@GetMapping("registerNaver")
	public String snsNaver() {
		
		return "member/login/registerNaver";
	}
	@GetMapping("registerUser")
	public String registerUser() {
		
		return "member/login/registerUser";
	}

}
