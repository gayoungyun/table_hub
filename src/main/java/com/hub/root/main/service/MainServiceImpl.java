package com.hub.root.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.hub.root.main.dto.MainDTO;
import com.hub.root.main.mybatis.mainMapper;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	mainMapper mapper;
	@Autowired
	MainFileService mfs;
	public int inputInfo(MainDTO dto) {
		try {
			return mapper.infoSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}	
	}
	public void infoSave(MultipartFile mul,String store_id,String store_menu_name,int store_menu_price,String store_menu_detail,String store_menu_category) {
		MainDTO dto = new MainDTO();
		dto.setStore_id(store_id);
		dto.setStore_menu_name(store_menu_name);
		dto.setStore_menu_price(store_menu_price);
		dto.setStore_menu_detail(store_menu_detail);
		dto.setStore_menu_category(store_menu_category);
		dto.setStore_menu_img("nan");
		
		if(!mul.isEmpty()) {
			System.out.println("dto : "+dto);
			System.out.println("mfs : "+mfs);
			System.out.println("mul : "+mul);
			dto.setStore_menu_img(mfs.saveFile(mul));//이미지 있을경우 처리
		}
		int result = 0;
		try {
			result = mapper.infoSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg, url;
		if(result == 1) {
			msg = "새글이 추가되었습니다";
			url = "/main/inputInfo";
		}else {
			msg = "문제가 발생되었습니다!";
			url = "/main/mainPage1";
		}
		//return getMessage(msg, url);
	}
	/*
	private String getMessage(String msg, String url) {
		String message= "<script>alert('"+msg+"');";
		message += "location.href='/root"+url+"';</script>";//root앞에 /없으면 상대경로라서 경로를 잘못인식
		return message;
	}
	*/
	public void mainPage1(Model model) {
		model.addAttribute("dtoList", mapper.mainPage1());
	}
}







