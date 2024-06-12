package com.hub.root.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

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
import com.hub.root.member.service.MemberInfoService;
import com.hub.root.member.service.MemberService;

@Controller
@RequestMapping("member/myPage")
public class MemberInfoController {
	@Autowired MemberService ms;

	@GetMapping("info")
	public String memberInfo(HttpSession session, Model model) {
		System.out.println(session.getAttribute("userId") == null);
		if (session.getAttribute("userId") == null) {
			return "/mainPage";
		} else {
			MemberDTO dto = ms.getMemberInfo((String)session.getAttribute("userId"));
			model.addAttribute(session);
			model.addAttribute("dto", dto);
			return "member/info/detail";			
		}
	}
	
	@GetMapping("download")
	public void download(@RequestParam String img, HttpServletResponse res) throws Exception {
		System.out.println("download실행 : " + img);
		String originImgName = img.split("_")[1];
		System.out.println("originImgName : " + originImgName);
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
}
