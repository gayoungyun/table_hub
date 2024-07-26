package com.hub.root.store.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hub.root.store.DTO.storeInfoDTO;
import com.hub.root.store.DTO.storeMenuDTO;
import com.hub.root.store.DTO.storeReviewDTO;
import com.hub.root.store.DTO.storeReviewImgDTO;
import com.hub.root.store.service.storeService;

@Controller
public class storeController {
	private final storeService ser;
	private storeInfoDTO infoDTO;
	private storeMenuDTO menuDTO;
	private storeReviewDTO reviewDTO;
	private storeReviewImgDTO reviewImgDTO;

	@Autowired
	public storeController(storeService ser) {
		this.ser = ser;
		System.out.println("보선-가게 컨트롤러 생성자 실행");
	}

	@GetMapping("store")
	public String store(HttpServletRequest request, Model model,
			@RequestParam(required=false) String store_id) {

		if(store_id == null) {
			HttpSession session = request.getSession();
		    store_id = (String) session.getAttribute("storeId");		
		}
			Map<String, Object> Map = ser.store(request, store_id);
			model.addAllAttributes(Map);
			return "store/store";
	}


	@GetMapping("/store/info")
	public String info(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
	    String store_id = (String) session.getAttribute("storeId");

		infoDTO = ser.storeInfo(store_id);
		model.addAttribute(infoDTO);
		return "store/info";
	}

	@GetMapping("/store/menu")
	public String menu(HttpServletRequest request, Model model) {
		return "store/menu";
	}

	@GetMapping("/store/review")
	public String review(HttpServletRequest request, Model model) {
		return "store/review";
	}

	@GetMapping("/store/photo")
	public String photo(HttpServletRequest request, Model model) {
		return "store/photo";
	}

	@GetMapping("/store/map")
	public String map(HttpServletRequest request) {
		return "store/map";
	}
	
	/*
	 	HttpSession session = request.getSession();
	    String store_id = (String) session.getAttribute("storeId");
		if(store_id == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다");
			request.setAttribute("url", "member/login");

	        return "businessM/businMalert";
	        } 
	 
	  
	 * */


