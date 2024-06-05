package com.hub.root.member.controller;

<<<<<<< HEAD
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
	public String registerUser(HttpServletRequest req, Model model) {
		Cookie[] Cookies = req.getCookies();
		String email = "";
		if (Cookies != null) {
			for(Cookie c : Cookies) {
				if (c.getName().equals("email")) {
					email = c.getValue();
				}
			}			
		}
//		String emailLocal[] = email.split("@");
		model.addAttribute("email", email);
=======
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
		
>>>>>>> branch 'guhyeon' of git@github.com:gayoungyun/table_hub.git
		return "member/login/registerUser";
	}

}
