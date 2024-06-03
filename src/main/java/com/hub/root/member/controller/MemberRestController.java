package com.hub.root.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hub.root.member.service.MemberService;

@RestController
@RequestMapping("member")
public class MemberRestController {
	@Autowired MemberService ms;

	@PostMapping(value="loginChk", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> loginChk(@RequestBody Map<String, Object> map, Model model, HttpSession session) {
		String id = (String)map.get("id");
		String pwd = (String)map.get("pwd");
		int result = ms.loginChk(id, pwd);
		
		
		if (result == 1 || result == 2) {
			session.setAttribute("userId", id);
			map.put("result", null);
			if (result == 2) {
				session.setAttribute("isAdmin", 1);
			}
			model.addAttribute(session);
		} else {
			map.put("result", "입력 정보가 일치하지 않습니다. <br>아이디 또는 비밀번호를 확인해주세요");
		}
		return map;
	}
	
	@PostMapping(value="sendMail", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sendMail(@RequestBody Map<String, Object> map, HttpServletRequest req, HttpServletResponse res, HttpSession session,
			Model model) {
		String email = (String)map.get("email");
		System.out.println("email: " + email);
		ms.sendMail(email, "이메일 테스트중입니다.", "1234");
		// 받는사람 이메일, 제목, 내용 순으로 넘겨준다.
		session.setAttribute(email, "1234");
		
		map.put("result", "인증 코드가 전송되었습니다.");
		model.addAttribute(session);
		
		
		return map;
	}
	@PostMapping(value="register", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> register(@RequestBody Map<String, Object> map, HttpServletRequest req, HttpServletResponse res, HttpSession session,
			Model model) {
		String code = (String)map.get("code");
		System.out.println("code : " + code);
		String ses = (String)session.getAttribute("smooth95@naver.com");
		System.out.println("Session : " + ses);
		int result;
		System.out.println(code == ses);
		System.out.println(code.equals(ses));
		if (code.equals(ses)) {
		 	result = 1;
		} else {
			result = 0;
		}
		
		map.put("result", result);
		
		return map;
	}
}
