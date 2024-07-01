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
			HttpSession session = request.getSession(false); // 세션이 없으면 null 반환
		    
		    if (session != null) {
		        Enumeration<String> attributeNames = session.getAttributeNames();
		        
		        
		        //attributeNames 세션의 모든 이름(키)을 가져옴, attributeValue 세션의 모든 값을 가져옴
		        while (attributeNames.hasMoreElements()) {
		            String attributeName = attributeNames.nextElement();
		            Object attributeValue = session.getAttribute(attributeName);
		            System.out.println("보선-세션 속성 " + attributeName + "의 값: " + attributeValue);
		        }
		    } else {
		        System.out.println("보선-세션이 없습니다.");
		    }
		    
		    String store_id = (String) session.getAttribute("storeId");
			String storeName = ser.businMChk(store_id);
			if(storeName == null) {
				request.setAttribute("msg", "문제 발생\n다시 시도해주세요");
		        request.setAttribute("url", "storeInfo");
		    
		        return "businessM/businMalert";
			}
		    
			model.addAttribute("storeName : ", storeName);
			model.addAttribute("storeId : ", store_id);
			System.out.println("store_id : " + store_id + ", storeName : " + storeName);
			
			return "businessM/register01";
		}
		
		@PostMapping("register02")//첫째 페이지 정보 받고, 둘째 페이지로 
		public String register02(HttpServletRequest request,
				@RequestParam("store_name") String store_name) {
			HttpSession session = request.getSession(false); // 세션이 없으면 null 반환
		    
		    if (session != null) {
		        Enumeration<String> attributeNames = session.getAttributeNames();
		        
		        
		        //attributeNames 세션의 모든 이름(키)을 가져옴, attributeValue 세션의 모든 값을 가져옴
		        while (attributeNames.hasMoreElements()) {
		            String attributeName = attributeNames.nextElement();
		            Object attributeValue = session.getAttribute(attributeName);
		            System.out.println("보선-세션 속성 " + attributeName + "의 값: " + attributeValue);
		        }
		    } else {
		        System.out.println("보선-세션이 없습니다.");
		    }
			
			  String store_id = (String) session.getAttribute("storeId");
			    System.out.println("보선-세션을 스트링으로 : " + store_id);
				String storeName = ser.businMChk(store_id);
				System.out.println("보선-서비스에서 나온 storeName : " + storeName);
				System.out.println("보선-고객입력 store_name : " + store_name);
				
				if(!storeName.equals(store_name)) {
					request.setAttribute("msg", "가게이름이 다릅니다. 다시 시도해주세요");
			        request.setAttribute("url", "register01");
			    
			        return "businessM/businMalert";
				}

			return "businessM/register02";
		}
		
		@PostMapping("register03")//둘째 페이지 정보 받고, 셋째 페이지로 
		public String register03(HttpSession session,
				@RequestParam("store_zip") String store_zip,
				@RequestParam("store_add") String store_add,
				@RequestParam("store_add_info") String store_add_info) {
			//파라미터 만드는건 입력폼의 name, 한번에 여러줄로 만들 수 없음
			
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
				@RequestParam("store_amenities") String[] store_amenitiesS,
				@RequestParam("store_note") String store_note,
				@RequestParam("store_max_person") int store_max_person,
				@RequestParam("store_booking_rule") String store_booking_rule) {
			
			session.setAttribute("store_introduce", store_introduce);
			String store_category = String.join(",", store_categoryS);
			session.setAttribute("store_category", store_category);
			//List<String> amenityList = Arrays.asList(store_amenities.split(","));
			String store_amenities = String.join(",", store_amenitiesS);
			session.setAttribute("store_amenities", store_amenities);
			session.setAttribute("store_note", store_note);
			session.setAttribute("store_max_person", store_max_person);
			session.setAttribute("store_booking_rule", store_booking_rule);
	
			System.out.println("store_introduce: " + store_introduce
				+ " , store_categories: " + store_category
				+ " , store_amenities: " + store_amenities
				+ " , store_note: " + store_note
				+ " , store_max_person: " + store_max_person
				+ " , store_booking_rule: " + store_booking_rule);
			
			return "businessM/register04";
		}
		
		
		@PostMapping("registerFinish")//가게 정보 DB에 저장하고, 마지막 페이지로 
		public String registerFinish(businMDTO dto, HttpSession session,
				@RequestParam("store_business_hours") String[] store_business_hours,
				HttpServletRequest request) {

			dto.setStore_zip((String) session.getAttribute("store_zip"));
			dto.setStore_add((String) session.getAttribute("store_add"));
			dto.setStore_add_info((String) session.getAttribute("store_add_info"));
			dto.setStore_introduce((String) session.getAttribute("store_introduce"));
			dto.setStore_category((String) session.getAttribute("store_category"));
			dto.setStore_amenities((String)session.getAttribute("store_amenities"));
			dto.setStore_note((String) session.getAttribute("store_note"));
			dto.setStore_max_person((Integer) session.getAttribute("store_max_person"));
			dto.setStore_booking_rule((String) session.getAttribute("store_booking_rule"));
			String store_business_hoursS = String.join(",", store_business_hours);
			System.out.println("store_business_hoursS : " + store_business_hoursS);
			dto.setStore_business_hours(store_business_hoursS);
			
			Enumeration<String> attributeNames = session.getAttributeNames();
			//attributeNames 세션의 모든 이름(키)을 가져옴, attributeValue 세션의 모든 값을 가져옴
	        while (attributeNames.hasMoreElements()) {
	            String attributeName = attributeNames.nextElement();
	            Object attributeValue = session.getAttribute(attributeName);
	            System.out.println("보선-세션 속성 " + attributeName + "의 값: " + attributeValue);
	        }
	            
			int result = ser.register(dto);
			System.out.println("서비스에서 나온 result : " + result);
			if(result == 0) {
				request.setAttribute("msg", "문제 발생\n다시 시도해주세요");
		        request.setAttribute("url", "register01");
		        
		        return "businessM/businMalert";
			}else {
				System.out.println("보선-가게등록 업뎃 성공");
			}
			// 세션 전체 삭제 (invalidate)
			// session.invalidate();
			
			// 세션에서 데이터 삭제
			session.removeAttribute("store_zip");
			session.removeAttribute("store_add");
			session.removeAttribute("store_add_info");
			session.removeAttribute("store_introduce");
			session.removeAttribute("store_category");
			session.removeAttribute("store_amenities");
			session.removeAttribute("store_max_person");
			session.removeAttribute("store_booking_rule");
			
			return "businessM/registerFinish";
		}
		
		@GetMapping("storeInfo")
		public String storeInfo() {
			return "businessM/storeInfo";
		}
		
	}

