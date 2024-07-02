package com.hub.root.businessM.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hub.root.businessM.DTO.businMDTO;
import com.hub.root.businessM.service.businMService;

@Controller
public class businMController {
	
		@Autowired
		private final businMService ser;
		public businMController(businMService ser) {
			this.ser = ser;
			System.out.println("보선-사업자 회원 컨트롤러 생성자 실행");
		}
		
		@GetMapping("register01")//단순 첫째 페이지 보여주기
		public String register01(HttpServletRequest request, Model model) {
			String result = ser.register01(request, model);
			return result;
		}
		
		@PostMapping("register02")//첫째 페이지 정보 받고, 둘째 페이지로 
		public String register02(HttpServletRequest request,
				@RequestParam("store_name") String store_name) {
			String result = ser.register02(request, store_name);
			return result;
		}
		
		@PostMapping("register03")//둘째 페이지 정보 받고, 셋째 페이지로 
		public String register03(HttpServletRequest request,
				@RequestParam("store_zip") String store_zip,
				@RequestParam("store_add") String store_add,
				@RequestParam("store_add_info") String store_add_info) {
			//파라미터 만드는건 입력폼의 name, 한번에 여러줄로 만들 수 없음
			
			String result = ser.register03(request, store_zip, store_add, store_add_info);
			return result;
		}
		
		@PostMapping("register04")//셋째 페이지 정보 받고, 넷째 페이지로 
		public String register04(HttpServletRequest request,
				@RequestParam("store_introduce") String store_introduce,
				@RequestParam("store_category") String[] store_categoryS,
				@RequestParam("store_amenities") String[] store_amenitiesS,
				@RequestParam("store_note") String store_note,
				@RequestParam("store_max_person") int store_max_person,
				@RequestParam("store_booking_rule") String store_booking_rule) {
		
			String result = ser.register04(request, store_introduce, store_categoryS, 
					store_amenitiesS, store_note, store_max_person, store_booking_rule);
			return result;
		}
		
		
		@PostMapping("registerFinish")//가게 정보 DB에 저장하고, 마지막 페이지로 
		public String registerFinish(businMDTO dto, HttpServletRequest request,
				@RequestParam("store_business_hours") String[] store_business_hours) {
			String result = ser.registerFinish(dto, request, store_business_hours);
			return result;
			
		}
		
		@GetMapping("storeInfo")
		public String storeInfo() {
			return "businessM/storeInfo";
		}
		
	}

