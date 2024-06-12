package com.hub.root.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hub.root.main.dto.MainDTO;
import com.hub.root.main.service.MainService;

@Controller
@RequestMapping("main")//main이라는 경로에 대한 요청
public class MainController {
	@Autowired MainService ms;
	@GetMapping("mainPage1")
	public String main(Model model) {
		ms.mainPage1(model);
		return "main/mainPage1";
	}
	/*
	@GetMapping("flex")
	public String flex() {
		return "main/flex";
	}
	@GetMapping("flex6")
	public String flex2() {
		return "main/flex6";
	}
	*/
	@GetMapping("header")
	public String header() {
		return "main/header";
	}
	@RequestMapping("inputInfo_form")
	public String inputInfo_form() {
		return "main/inputInfo";
	}
	@RequestMapping("inputInfo")
	public String inputInfo(MainDTO dto
							
							) throws Exception{
		System.out.println("regi img : "+dto.getStore_menu_img());
		int result = ms.inputInfo(dto);
		if(result == 1)
			return "redirect:/main/mainPage1";
		return "redirect:/main/inputInfo_form";
	}
	
}









