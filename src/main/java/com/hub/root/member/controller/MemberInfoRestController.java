package com.hub.root.member.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hub.root.member.service.MemberInfoService;

@RestController
@RequestMapping("member/myPage")
public class MemberInfoRestController {
	@Autowired MemberInfoService ms;
	
	
    @PostMapping(value="memberImgModify", produces = "application/json; charset=utf-8")
	public String memberImgModify(MultipartHttpServletRequest file, HttpSession session) {
		String msg;
		System.out.println("memberImgModify 컨트롤러 실행");
		int result = ms.memberImgModify(file, (String)session.getAttribute("userId"), file.getParameter("imgName"));
		if (result == 1) {
			msg = "저장이 완료되었습니다.";
		} else {
			msg = "저장하는 과정에서 문제가 발생하였습니다. 새로고침후 다시 진행해주세요";
		}
		
		return msg;
	}
    
    @PostMapping(value="memberImgDelete", produces = "application/json;charset=utf-8")
    public String memberImgDelete(@RequestBody Map<String, Object> map) {
    	System.out.println("MemberImgDelete 컨트롤러 실행");
    	String msg = ms.memberImgDelete((String)map.get("imgName"), (String)map.get("id"));
    	return msg;
    }
    
    @PutMapping(value="memberNickModify", produces="application/json; charset=utf-8")
    public String memberNickModify(@RequestBody Map<String, Object> map, HttpSession session) {
    	System.out.println("memberNickModify 컨트롤러 실행");
    	String msg = ms.memberNickModify( (String)map.get("nick"), (String)session.getAttribute("userId"));
    	return msg;
    }
    @PutMapping(value="memberStatusModify", produces="application/json; charset=utf-8")
    public String memberStatusModify(@RequestBody Map<String, Object> map, HttpSession session) {
    	System.out.println("memberStatusChk 실행 status : " + map.get("status"));
    	
    	String msg = ms.memberStatusModify((String)map.get("status"), (String)session.getAttribute("userId"));
    	
    	return msg;
    }
    @PatchMapping(value="memberPhone", produces="application/json; charset=utf-8")
    public String memberPhone(@RequestBody Map<String, Object> map, HttpSession session) {
    	System.out.println(map.get("phone"));
    	
    	String msg = ms.memberPhoneModify((String)map.get("phone"), (String)session.getAttribute("userId"));
    	return msg;
    }
    
    @PatchMapping(value="memberEmail", produces="application/json; charset=utf-8")
    public Map<String, Object> memberEmail(@RequestBody Map<String, Object> map, HttpSession session, HttpServletRequest req) {
    	
    	Cookie[] cookie = req.getCookies();
		String code = (String)map.get("code");

		String email = "";
		if (cookie != null) {
			for(Cookie c : cookie) {
				if (c.getName().equals("email")) {
					email = c.getValue();
					break;
				}
			}			
		}
		String ses = (String)session.getAttribute(email);
		int result;
		if (code.equals(ses)) {
	    	map = ms.memberEmailModify((String)map.get("email"), (String)session.getAttribute("userId"));
		} else {
			map.put("result", -1);
			map.put("msg", "인증코드가 일치하지 않습니다. 다시 확인해주세요");
		}
		
    	return map;
    }
    
    @PatchMapping(value="memberPassword", produces="application/json; charset=utf-8")
    public Map<String, Object> memberPassword (@RequestBody Map<String, Object> map, HttpSession session) {
    	String currentPwd = (String)map.get("currentPwd");
    	String changePwd = (String)map.get("changePwd");
    	map = ms.memberPasswordModify(currentPwd, changePwd, (String)session.getAttribute("userId"));
    	if ((int)map.get("result") == 1) {
    		session.invalidate();
    	}
    	return map;
    }
    
    
    
	
}
