package com.hub.root.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class storeController {
	public storeController() {
		System.out.println("가게 컨트롤러 생성자 실행");
	}
	
	@GetMapping("store")
	public String store() {
		return "store/store";
	}
	
	@GetMapping("/store/info")
	public String info() {
		return "store/info";
	}
	@GetMapping("/store/menu")
	public String menu() {
		return "store/menu";
	}
	@GetMapping("/store/review")
	public String review() {
		return "store/review";
	}
	@GetMapping("/store/photo")
	public String photo() {
		return "store/photo";
	}
	@GetMapping("/store/map")
	public String map() {
		return "store/map";
	}
}

