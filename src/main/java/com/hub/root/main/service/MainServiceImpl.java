package com.hub.root.main.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.hub.root.main.dto.MainDTO;
import com.hub.root.main.dto.MainMapDTO;
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
	}
	public List<MainDTO> mainPage1(Model model) {
		//String store_id = "123";
		List<MainDTO> dtoList = mapper.mainPage1();
		model.addAttribute("dtoList", dtoList);
		return dtoList;
	}
	public List<MainDTO> search(String keyword, String searchType) {
		Map<String, Object> params = new HashMap<>();
	    params.put("keyword", keyword);
	    params.put("searchType", searchType);
	    
	    
	    return mapper.search(params);   
	}
	public List<MainMapDTO> getStoreInfo() {
		List<MainMapDTO> storeList = mapper.getStoreInfo();
		System.out.println("storeList : "+storeList);
		return storeList;
	}
	public void storeSave(String store_id,String store_pwd,String store_email,String store_phone,String store_main_phone,String store_name,String store_add,
			String store_add_info,String store_category,String store_note,String store_introduce,String store_business_hours) {
		MainMapDTO dto = new MainMapDTO();
		dto.setStore_id(store_id);
		dto.setStore_pwd(store_pwd);
		dto.setStore_email(store_email);
		dto.setStore_phone(store_phone);
		dto.setStore_main_phone(store_main_phone);
		dto.setStore_name(store_name);
		dto.setStore_add(store_add_info);
		dto.setStore_add_info(store_add_info);
		dto.setStore_category(store_category);
		dto.setStore_note(store_note);
		dto.setStore_introduce(store_introduce);
		dto.setStore_business_hours(store_business_hours);
		
		mapper.storeSave(dto);
		
	}
		
}







