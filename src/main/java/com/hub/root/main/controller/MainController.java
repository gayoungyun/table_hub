package com.hub.root.main.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
	@RequestMapping("inputInfo")
	public String inputInfo() {
		return "main/inputInfo";
	}
	@RequestMapping("infoSave")
	public void infoSave(@RequestParam("store_menu_img") MultipartFile mul,
							HttpServletResponse res,
							@RequestParam String store_id,
							@RequestParam String store_menu_name,
							@RequestParam int store_menu_price,
							@RequestParam String store_menu_detail,
							@RequestParam String store_menu_category) throws IOException{
		ms.infoSave(mul,store_id,store_menu_name,store_menu_price,store_menu_detail,store_menu_category);
		
	}
	
}









