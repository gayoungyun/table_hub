package com.hub.root.businessM.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
			System.out.println("사업자 회원 컨트롤러 생성자 실행");
		}
		
		@GetMapping("register01")//단순 첫째 페이지 보여주기
		public String register01() {
			return "businessM/register01";
		}
		
		@PostMapping("register02")//첫째 페이지 정보 받고, 둘째 페이지로 
		public String register02(HttpSession session,
				@RequestParam("store_name") String store_name,
				@RequestParam("store_id") String store_id) {
			//파라미터 만드는건 입력폼의 name, 한번에 여러줄로 만들 수 없음
			
			// 세션에 값 넣기
			session.setAttribute("store_name", store_name);
			session.setAttribute("store_id", store_id);
			
			// 사용자가 입력한 값 확인
	        System.out.println("store_name: " + store_name
	        		+ " , store_id: " + store_id);
	        

			return "businessM/register02";
		}
		
		@PostMapping("register03")//둘째 페이지 정보 받고, 셋째 페이지로 
		public String register03(HttpSession session,
				@RequestParam("store_zip") String store_zip,
				@RequestParam("store_add") String store_add,
				@RequestParam("store_add_info") String store_add_info) {
			
			session.setAttribute("store_zip", store_zip);
			session.setAttribute("store_add", store_add);
			session.setAttribute("store_add_info", store_add_info);
	
	        System.out.println("store_zip: " + store_zip
	        		+ " , store_add: " + store_add
			        + " , store_add: " + store_add_info);
			

			return "businessM/register03";
		}
		
		@PostMapping("register04")//셋째 페이지 정보 받고, 넷째 페이지로 
		public String register04(HttpSession session,
				@RequestParam("store_introduce") String store_introduce,
				@RequestParam("store_category") String[] store_categoryS,
				@RequestParam("store_business_hours") String store_business_hours,
				@RequestParam("store_amenities") String[] store_amenitiesS,
				@RequestParam("store_main_phone") String store_main_phone,
				@RequestParam("store_phone") String store_phone,
				@RequestParam("store_note") String store_note,
				@RequestParam("store_max_person") int store_max_person,
				@RequestParam("store_booking_rule") String store_booking_rule) {
			
			session.setAttribute("store_introduce", store_introduce);
			String store_category = String.join(",", store_categoryS);
			session.setAttribute("store_category", store_category);
			session.setAttribute("store_business_hours", store_business_hours);
			//List<String> amenityList = Arrays.asList(store_amenities.split(","));
			String store_amenities = String.join(",", store_amenitiesS);
			session.setAttribute("store_amenities", store_amenities);
			session.setAttribute("store_main_phone", store_main_phone);
			session.setAttribute("store_phone", store_phone);
			session.setAttribute("store_note", store_note);
			session.setAttribute("store_max_person", store_max_person);
			session.setAttribute("store_booking_rule", store_booking_rule);
	
			System.out.println("store_introduce: " + store_introduce
				+ " , store_categories: " + store_categoryS
				+ " , store_business_hours: " + store_business_hours
				+ " , store_amenities: " + store_amenitiesS
				+ " , store_main_phone: " + store_main_phone
				+ " , store_phone: " + store_phone
				+ " , store_note: " + store_note
				+ " , store_max_person: " + store_max_person
				+ " , store_booking_rule: " + store_booking_rule);
			
			return "businessM/register04";
		}
		
		
		@PostMapping("registerFinish")//가게 정보 DB에 저장하고, 마지막 페이지로 
		public String registerFinish(businMDTO dto, HttpSession session,
				HttpServletRequest request) {
			dto.setStore_pwd("임시비밀번호");
			dto.setStore_name((String) session.getAttribute("store_name"));
			dto.setStore_id((String) session.getAttribute("store_id"));
			dto.setStore_zip((String) session.getAttribute("store_zip"));
			dto.setStore_add((String) session.getAttribute("store_add"));
			dto.setStore_add_info((String) session.getAttribute("store_add_info"));
			dto.setStore_introduce((String) session.getAttribute("store_introduce"));
			dto.setStore_category((String) session.getAttribute("store_category"));
			dto.setStore_business_hours((String) session.getAttribute("store_business_hours"));
			dto.setStore_amenities((String)session.getAttribute("store_amenities"));
			dto.setStore_main_phone((String) session.getAttribute("store_main_phone"));
			dto.setStore_phone((String) session.getAttribute("store_phone"));
			dto.setStore_note((String) session.getAttribute("store_note"));
			dto.setStore_max_person((Integer) session.getAttribute("store_max_person"));
			dto.setStore_booking_rule((String) session.getAttribute("store_booking_rule"));
			
			System.out.println("store_name: " + dto.getStore_name());
			System.out.println("store_pwd: " + dto.getStore_pwd());
			System.out.println("store_email: " + dto.getStore_email());
			int result = ser.register(dto);
			System.out.println("서비스에서 나온 result : " + result);
			if(result == 0) {
				request.setAttribute("msg", "문제 발생\n다시 시도해주세요");
		        request.setAttribute("url", "businessM/storeInfo");
		        
		        // 세션에서 데이터 삭제
		        // session.removeAttribute("username");
		        // session.removeAttribute("password");
		        
		        // 세션 전체 삭제 (invalidate)
		        // session.invalidate();
		        
		        return "businessM/businMalert";
			}
			return "businessM/registerFinish";
		}
		
		@GetMapping("storeInfo")
		public String storeInfo() {
			return "businessM/storeInfo";
		}
		
	}

