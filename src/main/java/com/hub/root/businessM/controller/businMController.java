package com.hub.root.businessM.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
			
			HttpSession session = request.getSession();
		    String store_id = (String) session.getAttribute("storeId");
			if(store_id == null) {
				request.setAttribute("msg", "로그인이 필요한 서비스입니다");
		        request.setAttribute("url", "member/login");
		        return "businessM/businMalert";
			}
			
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
		
		@GetMapping("businMmenu")//사업자 마이페이지
		public String businMmenu(HttpServletRequest request) {
			HttpSession session = request.getSession();
		    String store_id = (String) session.getAttribute("storeId");
			if(store_id == null) {
				request.setAttribute("msg", "로그인이 필요한 서비스입니다");
		        request.setAttribute("url", "member/login");
		        return "businessM/businMalert";
			}
			return "businessM/businMmenu";
		}
		
		@GetMapping("/businessM/menuInfo")//마이페이지 내 메뉴정보확인
		public String menuInfo() {
			return "businessM/info/menuInfo";
		}
		
		@GetMapping("/businessM/storeInfo")//마이페이지 내 정보확인및수정(기본메뉴페이지)
		public String storeInfo() {
			return "businessM/info/storeInfo";
		}
		
		@GetMapping("/businessM/photoInfo")//마이페이지 내 사진정보확인
		public String photoInfo() {
			return "businessM/info/photoInfo";
		}
		
		@GetMapping("/businessM/reviewInfo")//마이페이지 내 고객후기보기
		public String reviewInfo() {
			return "businessM/info/reviewInfo";
		}
		
		@GetMapping("/businessM/bookInfo")//마이페이지 내 예약관리
		public String bookInfo() {
			return "businessM/info/bookInfo";
		}

		
		@GetMapping("/businessM/menu/menuRegister")//메뉴등록화면
		public String menuRegister() {
			return "businessM/menu/menuRegister";
		}
		@GetMapping("/businessM/menu/menuRFinish")//메뉴등록 완료화면
		public String menuRFinish() {
			return "businessM/menu/menuRFinish";
		}
		
		@GetMapping("/businessM/photo/photoRegister")//사진등록화면
		public String photoRegister() {
			return "businessM/photo/photoRegister";
		}
		@GetMapping("/businessM/photo/photoRFinish")//사진등록 완료화면
		public String photoRFinish() {
			return "businessM/photo/photoRFinish";
		}
		

			
	    @PostMapping("/storePhotoUpload")//사진 정보 DB에 저장하고, 마지막 페이지로 
	    @ResponseBody
	    public String handleFileUpload(HttpServletRequest request,
	            @RequestParam("storeImage01") MultipartFile file01,
	            @RequestParam("storeImage02") MultipartFile file02,
	            @RequestParam("storeImage03") MultipartFile file03,
	            @RequestParam("storeImage04") MultipartFile file04,
	            @RequestParam("storeImage05") MultipartFile file05 ) {
	    	String result = ser.storeImage(request, file01, file02, file03, file04, file05);
	    	return result;
	    }
	    

		    
		
	}
