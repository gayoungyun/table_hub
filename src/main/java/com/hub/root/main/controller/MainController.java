package com.hub.root.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main")//main이라는 경로에 대한 요청
public class MainController {
	@GetMapping("mainPage1")
	public String main() {
		return "main/mainPage1";
	}
	@GetMapping("flex")
	public String flex() {
		return "main/flex";
	}
	@GetMapping("flex1")
	public String flex1() {
		return "main/flex1";
	}
	@GetMapping("header")
	public String header() {
		return "main/header";
	}
}
