package com.hub.root.main.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hub.root.main.dto.MainDTO;
import com.hub.root.main.dto.MainMapDTO;
import com.hub.root.main.service.MainFileService;
import com.hub.root.main.service.MainService;

import retrofit2.http.GET;

@Controller
@RequestMapping("main")//main이라는 경로에 대한 요청
public class MainController {
	@Autowired MainService ms;
	// 헤더 페이지 요청 처리===================================
	@GetMapping("header")
	public String header() {
		return "main/header";
	}
	// 메인 페이지1 요청 처리===================================
	@GetMapping("mainPage1")
	public String main( HttpSession session,Model model) {
		String user = (String) session.getAttribute("userId");
		System.out.println("session id main : "+user);
		if(user != null) {
			model.addAttribute("user", user);
		}	
		List<String> categories = ms.getAllCategories();
		List<MainDTO> dtoList = ms.mainPage1(model);
		model.addAttribute("categories", categories);
		model.addAttribute("dtoList", dtoList);
		return "main/mainPage1";
	}
	// mainPage1에 카테고리별 이미지 가져오기 =====================
	@GetMapping("menuByCategory")
	public String getMenuByCategory(@RequestParam String category, Model model) {
		List<MainDTO> dtoList = ms.getMenuByCategory(category);
		model.addAttribute("dtoList", dtoList);
		return "main/mainPage1";
	}
	// 메인 페이지2 요청 처리===================================
	@RequestMapping("mainPage2")
	public String mainPage2(@RequestParam(required=false) String keyword, 
			 				@RequestParam(required=false) String searchType,
			 				@RequestParam(required=false) String category,
			 				Model model) {    
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword != null ? keyword : "");
        params.put("searchType", searchType != null ? searchType : "");
        params.put("category", category != null ? category : "");
        
	    List<MainMapDTO> storeList = ms.getStoreInfo(params);
	    List<Map<String, Object>> imgList = ms.getMenuImage(params);
	    
		model.addAttribute("storeList",storeList);
		model.addAttribute("storeListSize",storeList.size());
		model.addAttribute("imgList", imgList);

		
		String key = keyword;
		String search = searchType;
		String cat = category;
		if(keyword.equals(""))
			key = "null";
		if(searchType.equals(""))
			search = "null";
		if(category.equals(""))
			cat = "null";
		
		model.addAttribute("keyword", key);
		model.addAttribute("searchType", search);
		model.addAttribute("category", cat);
		
		return "main/mainPage2";
	}
	// 정보 입력 페이지 요청 처리(store_menu)====================
	@RequestMapping("inputInfo")
	public String inputInfo() {
		return "main/inputInfo";
	}
	// 정보 저장 요청 처리(store_menu)=========================
	@RequestMapping("infoSave")
	public void infoSave(@RequestParam("store_menu_img") MultipartFile mul,
							HttpServletResponse res,
							@RequestParam String store_id,
							@RequestParam String store_menu_name,
							@RequestParam int store_menu_price,
							@RequestParam String store_menu_detail,
							@RequestParam String store_menu_category) throws IOException{
		String imagePath  = ms.saveMenuImage(mul);
		ms.infoSave(store_id,store_menu_name,store_menu_price,store_menu_detail,store_menu_category, imagePath);
		//ms.saveImagePathToStoreImg(store_id, imgPath);
	}
	// 파일 다운로드 요청 처리==================================
	@GetMapping("download")
	public void download(@RequestParam String fileName, HttpServletRequest req, HttpServletResponse res) throws Exception {
	    File file = new File(MainFileService.IMAGE_REPO + "/" + fileName);

	    if (file.exists()) {
	        String mimeType = req.getServletContext().getMimeType(file.getName());
	        if (mimeType == null) {
	            mimeType = "application/octet-stream";
	        }
	        res.setContentType(mimeType);
	        res.setContentLength((int) file.length());
	        res.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

	        try (FileInputStream in = new FileInputStream(file)) {
	            FileCopyUtils.copy(in, res.getOutputStream());
	        }
	    } else {
	        System.err.println("File not found: " + file.getAbsolutePath());
	        res.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
	    }
	}

	// 정보 입력 페이지 요청 처리(store_info)====================
	@RequestMapping("storeInfo")
	public String storeInfo() {
		return "main/storeInfo";
	}
	// 정보 저장 요청 처리(store_info)=========================
	@RequestMapping("storeSave")
	public void storeSave(	HttpServletResponse res,
							@RequestParam String store_id,
							@RequestParam String store_pwd,
							@RequestParam String store_email,
							@RequestParam String store_phone,
							@RequestParam String store_main_phone,
							@RequestParam String store_name,
							@RequestParam String store_add,
							@RequestParam String store_add_info,
							@RequestParam String store_category,
							@RequestParam String store_note,
							@RequestParam String store_introduce,
							@RequestParam String store_business_hours) throws IOException{
		ms.storeSave(store_id,store_pwd,store_email,store_phone,store_main_phone,store_name,store_add,
				store_add_info,store_category,store_note,store_introduce,store_business_hours);
	}

}









