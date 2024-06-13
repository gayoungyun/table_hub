package com.hub.root.businessM.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class businMController {
		public businMController() {
			System.out.println("사업자 회원 컨트롤러 생성자 실행");
		}
		
		@GetMapping("register01")//단순 첫째 페이지 보여주기
		public String register01() {
			return "businessM/register01";
		}
		
		@PostMapping("register02")//첫째 페이지 정보 받고, 둘째 페이지로 
		public String register02() {
			return "businessM/register02";
		}
		
		@PostMapping("register03")//둘째 페이지 정보 받고, 셋째 페이지로 
		public String register03() {
			return "businessM/register03";
		}
		
		@PostMapping("register04")//셋째 페이지 정보 받고, 넷째 페이지로 
		public String register04() {
			return "businessM/register04";
		}
		
		@PostMapping("registerFinish")//회원가입 정보 DB에 저장하고, 마지막 페이지로 
		public String registerFinish() {
			return "businessM/registerFinish";
		}
		
		@GetMapping("storeInfo")
		public String storeInfo() {
			return "businessM/storeInfo";
		}
		
	}
