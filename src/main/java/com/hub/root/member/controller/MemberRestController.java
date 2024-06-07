package com.hub.root.member.controller;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hub.root.member.dto.MemberDTO;
import com.hub.root.member.service.MemberService;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@RestController
@RequestMapping("member")
public class MemberRestController {
	@Autowired MemberService ms;
	
	DefaultMessageService messageService = null;

    public void ExampleController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSXFJQDSLMPZION", "XPIBYZQ2FMUJEYGEH1UQEX3UES3L9GOO", "https://api.coolsms.co.kr");
    }
    
    public int randomNumber() {
    	Random random = new Random();
    	int num = 1000 + random.nextInt(9000);
    	System.out.println("num : " + num);
    	return num;
    }
    
    @PostMapping(value="sendMessage", produces = "application/json; charset=utf-8")
    public String sendOne(@RequestBody Map<String, Object> map, HttpSession session, Model model) {
    	ExampleController();

    	int code = randomNumber();
    	
    	String phoneNumber = (String)map.get("phoneNumber");
//        Message message = new Message();
//		 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
//        message.setFrom("01099062986");
//		message.setTo(phoneNumber);
//		message.setText("인증 코드는 [ " + code + " ] 입니다. 코드 입력 후 회원가입을 진행하세요");
    	
//		SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
    	
    	session.setAttribute("phoneNumber", phoneNumber);
    	session.setAttribute(phoneNumber, code);
    	model.addAttribute(session);
    	
    	
    	return "문자로 4자리 코드가 발송되었습니다.";
    }
    
    @PostMapping(value="codeChk", produces = "application/json; charset=utf-8")
    public int codeChk(@RequestBody Map<String, Object> map, HttpSession session, Model model) {
    	
    	String phoneNumber = (String)session.getAttribute("phoneNumber");
    	int inputCode = Integer.parseInt((String)map.get("inputCode"));
    	int code = (Integer)session.getAttribute(phoneNumber);
    	
    	
    	if (inputCode == code) {
    		System.out.println("인증코드 일치함");
    		return 1;
    	} else {
    		System.out.println("인증코드 불일치");
    		return 0;
    	}
    	
    }

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
		int result = ms.mailChk(email);
		if (result == 1) {
			map.put("result", "이미 등록되어있는 주소입니다. 로그인 또는 아이디 찾기를 진행해주세요");
		} else {
			Cookie cookie = new Cookie("email", email);
			cookie.setMaxAge(5 * 60); // 5분
			res.addCookie(cookie);
	    	int code = randomNumber();
	    	String msg = "인증번호는 [" + code + "] 입니다.\n 해당 코드를 입력해주세요";
			ms.sendMail(email, "인증번호를 확인해주세요", msg);
//			 받는사람 이메일, 제목, 내용 순으로 넘겨준다.
			String codeKey = String.valueOf(code);
			session.setAttribute(email, codeKey);
			
			map.put("result", "인증 코드가 전송되었습니다.");
			model.addAttribute(session);			
		}
		
		
		return map;
	}
	@PostMapping(value="register", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> register(@RequestBody Map<String, Object> map, HttpServletRequest req, HttpServletResponse res, HttpSession session,
			Model model) {
		String code = (String)map.get("code");
		
		Cookie[] Cookies = req.getCookies();
		String email = "";
		if (Cookies != null) {
			for(Cookie c : Cookies) {
				if (c.getName().equals("email")) {
					email = c.getValue();
					break;
				}
			}			
		}
		String ses = (String)session.getAttribute(email);
		int result;
		if (code.equals(ses)) {
		 	result = 1;
		} else {
			result = 0;
		}
		map.put("result", result);
		return map;
	}
	
	@GetMapping(value="idChk", produces = "application/json; charset=utf-8")
	public int idChk(@RequestParam String id) {
		int result = ms.idChk(id);
		System.out.println("id : " + id);
		System.out.println("result : " + result);
		
		return result;
	}
	@GetMapping(value="nickChk", produces = "application/json; charset=utf-8")
	public int nickChk(@RequestParam String nick) {
		int result = ms.nickChk(nick);
		
		return result;
	}
	
	
	@PostMapping(value="registerChk", produces = "application/json; charset=utf-8")
	public int registerChk(@RequestBody Map<String, Object> map) {
		System.out.println("id : " + (String)map.get("id"));
		System.out.println("pwd : " + (String)map.get("pwd"));
		System.out.println("nick : " + (String)map.get("nick"));
		System.out.println("phone : " + (String)map.get("phone"));
		System.out.println("email : " + (String)map.get("email"));
		System.out.println("birth : " + (String)map.get("birth"));
		System.out.println("gender : " + (Integer)map.get("gender"));
		MemberDTO dto = new MemberDTO();
		dto.setId((String)map.get("id"));
		if (map.get("pwd") == null) {
			dto.setPwd("none");
		} else {
			dto.setPwd((String)map.get("pwd"));			
		}
		dto.setNick((String)map.get("nick"));
		dto.setPhone((String)map.get("phone"));
		dto.setEmail((String)map.get("email"));
		dto.setBirth((String)map.get("birth"));
		dto.setGender((Integer)map.get("gender"));
		int result = ms.register(dto);
		System.out.println("result : " + result);
		return result;
	}
	
}
