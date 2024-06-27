package com.hub.root.member.controller.info;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hub.root.member.dto.MemberDTO;
import com.hub.root.member.service.info.MemberInfoService;

@Controller
@RequestMapping("member/myPage")
public class MemberInfoController {
	@Autowired MemberInfoService mis;

	@GetMapping("info")
	public String memberInfo(HttpSession session, Model model, HttpServletRequest req) {
    	System.out.println("memRestCont info 실행");
			return "member/info/pwdCheck";
	}
	
	@GetMapping("detail")
	public String detail (HttpSession session, HttpServletRequest req, Model model) {
    	System.out.println("memRestCont detail 실행");
		MemberDTO dto = mis.getMemberInfo((String)session.getAttribute("userId"));
		model.addAttribute(session);
		model.addAttribute("dto", dto);
		return "member/info/detail";
		
	}
	
	@GetMapping("download")
	public void download(@RequestParam String img, HttpServletResponse res) throws Exception {
    	System.out.println("memRestCont download 실행");
		String originImgName = img.split("_")[1];
		res.setContentType("text/plain; charset=utf-8");
		res.addHeader("Content-disposition", "attachment;fileName="+URLEncoder.encode(img, "UTF-8"));
		File file;
		if (originImgName.equals("default.jpg")) {
			file = new File(MemberInfoService.IMAGE_REPO + "/" + originImgName);			
		} else {
			file = new File(MemberInfoService.IMAGE_REPO + "/" + img);			
		}
		if(file.exists()) {
			FileInputStream in = new FileInputStream(file);
			FileCopyUtils.copy(in, res.getOutputStream());
			in.close();			
		}
	}
	
	@GetMapping("myBooking")
	public String myBooking(Model model, HttpSession session) {
    	System.out.println("memRestCont myBooking 실행");
		model.addAttribute(session);
		return "member/info/myBooking";
	}
	
	@GetMapping("deleteUser")
	public String deleteUser() {
    	System.out.println("memRestCont deleteUser 실행");
		
		return "member/info/deleteUser";
	}
	
	@GetMapping("myReview")
	public String myReview() {
    	System.out.println("memRestCont myReview 실행");
		
		return "member/info/myReview";
	}
	
	@GetMapping("myBoard")
	public String myBoard() {
    	System.out.println("memRestCont myBoard 실행");
		
		return "member/info/myBoard";
	}
	
	@GetMapping("myReply")
	public String myReply() {
    	System.out.println("memRestCont myReply 실행");
		
		return "member/info/myReply";
	}
}
