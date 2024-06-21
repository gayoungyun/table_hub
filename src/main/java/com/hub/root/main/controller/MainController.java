package com.hub.root.main.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hub.root.main.dto.MainDTO;
import com.hub.root.main.service.MainFileService;
import com.hub.root.main.service.MainService;

@Controller
@RequestMapping("main")//main이라는 경로에 대한 요청
public class MainController {
	@Autowired MainService ms;
	// 메인 페이지1 요청 처리===================================
	@GetMapping("mainPage1")
	public String main(Model model) {
		//String store_id = "123";
		ms.mainPage1(model);
		return "main/mainPage1";
	}
	// 메인 페이지 요청 처리===================================
	@GetMapping("mainPage2")
	public String main() {
		return "main/mainPage2";
	}
	// 메인 페이지 검색 기능===================================
	@GetMapping("search")
	public String search(@RequestParam(required=false) String keyword, 
						 @RequestParam(required=false) String searchType ,
						Model model) {
		List<MainDTO> dtoList = ms.search(keyword,searchType);
		model.addAttribute("dtoList", dtoList);
		return "main/search";
	}
	// 헤더 페이지 요청 처리===================================
	@GetMapping("header")
	public String header() {
		return "main/header";
	}
	// 정보 입력 페이지 요청 처리===============================
	@RequestMapping("inputInfo")
	public String inputInfo() {
		return "main/inputInfo";
	}
	// 정보 저장 요청 처리====================================
	@RequestMapping("infoSave")
	public void infoSave(@RequestParam("store_menu_img") MultipartFile mul,
							HttpServletResponse res,
							@RequestParam String store_id,
							@RequestParam String store_menu_name,
							@RequestParam int store_menu_price,
							@RequestParam String store_menu_detail,
							@RequestParam String store_menu_category) throws IOException{
		ms.infoSave(mul,store_id,store_menu_name,store_menu_price,store_menu_detail,store_menu_category);
	}
	// 파일 다운로드 요청 처리==================================
	@GetMapping("download")
	 public void download(@RequestParam String fileName, HttpServletRequest req, HttpServletResponse res) throws Exception {
        // 다운로드할 파일 경로 설정
		File file = new File(MainFileService.IMAGE_REPO + "/" + fileName);

        if (file.exists()) {
            //  파일이 존재하면 MIME type 설정
            String mimeType = req.getServletContext().getMimeType(file.getName());
            if (mimeType == null) {
                mimeType = "application/octet-stream";// 기본 MIME 타입 설정
            }
            res.setContentType(mimeType); //응답 MIME 타입 설정
            res.setContentLength((int) file.length()); //응답길이 설정
            res.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            // 다운로드 시 파일 이름 설정

            // 파일을 응답 스트림으로 복사
            try (FileInputStream in = new FileInputStream(file)) {
                FileCopyUtils.copy(in, res.getOutputStream());
            }
        } else {
        	// 파일이 존재하지 않으면 404에러 응답
            res.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
        }
	}
	/*
	@GetMapping("flex6")
	public String flex2() {
		return "main/flex6";
	}
	*/
}









