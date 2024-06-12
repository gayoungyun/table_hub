package com.hub.root.businessM.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class businMController {
		public businMController() {
			System.out.println("사업자 회원 컨트롤러 생성자 실행");
		}
		
		@GetMapping("register01")
		public String register01() {
			return "businessM/register01";
		}
		
		@GetMapping("register02")
		public String register02() {
			return "businessM/register02";
		}
		
		@GetMapping("register03")
		public String register03() {
			return "businessM/register03";
		}
		
		@GetMapping("register04")
		public String register04() {
			return "businessM/register04";
		}
		
		@GetMapping("registerFinish")
		public String registerFinish() {
			return "businessM/registerFinish";
		}
		
	}
