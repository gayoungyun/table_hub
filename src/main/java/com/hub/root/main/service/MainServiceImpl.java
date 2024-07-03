package com.hub.root.main.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.hub.root.main.dto.MainDTO;
import com.hub.root.main.dto.MainImgDTO;
import com.hub.root.main.dto.MainMapDTO;
import com.hub.root.main.mybatis.mainMapper;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	mainMapper mapper;
	@Autowired
	MainFileService mfs;
	public List<MainDTO> mainPage1(Model model) {
		List<MainDTO> dtoList = mapper.mainPage1();
		model.addAttribute("dtoList", dtoList);
		return dtoList;
	}
	public List<String> getAllCategories() {
		List<String> categories = mapper.getAllCategories();
	    Set<String> uniqueCategories = new HashSet<>();
	    for (String category : categories) {
	        String[] splitCategories = category.split("/");
	        for (String splitCategory : splitCategories) {
	            uniqueCategories.add(splitCategory.trim());
	        }
	    }
	    return new ArrayList<>(uniqueCategories);
	}
	public List<MainDTO> getMenuByCategory(String category){
		return mapper.getMenuByCategory(category);
	}
	public List<MainMapDTO> getStoreInfo(Map<String, Object> params) {
		return mapper.getStoreInfo(params);
	}
	public List<MainMapDTO> getStoreInfoByCategory(String category) {
	    List<MainMapDTO> storeList = mapper.getStoreInfoByCategory(category);
	    return storeList;
	}
	public List<Map<String, Object>> getMenuImage(Map<String, Object> params){
	    //return imgList;
		return mapper.getMenuImage(params);
	}
	public List<MainMapDTO> getStoreImgList(Map<String, Object> params){
		
		List<MainMapDTO> storeImgList = mapper.getStoreImgList(params);
		System.out.println("imglist ser :"+storeImgList );
		return storeImgList;
	}
	public List<MainImgDTO> getStoreImage(String storeId) {
		return mapper.getStoreImage(storeId);
	}
	public int inputInfo(MainDTO dto) {
		try {
			return mapper.infoSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}	
	}
	public void infoSave(String store_id,String store_menu_name,int store_menu_price,
						String store_menu_detail,String store_menu_category, String imagePath) {
		MainDTO dto = new MainDTO();
		dto.setStore_id(store_id);
		dto.setStore_menu_name(store_menu_name);
		dto.setStore_menu_price(store_menu_price);
		dto.setStore_menu_detail(store_menu_detail);
		dto.setStore_menu_category(store_menu_category);
		dto.setStore_menu_img(imagePath  != null ? imagePath  : "nan");

		//dto.setStore_menu_img("nan");
		
		/*
		if(!mul.isEmpty()) {
			dto.setStore_menu_img(mfs.saveFile(mul));//이미지 있을경우 처리
		}
		String imgPath = null;
		if (!mul.isEmpty()) {
			imgPath = mfs.saveFile(mul); // 이미지 파일 저장 및 경로 반환
			dto.setStore_menu_img(imgPath); // store_menu 테이블에 저장할 이미지 경로 설정
		}
		*/
		int result = 0;
		try {
			result = mapper.infoSave(dto);
			if (result == 1 && imagePath  != null) {
				saveImagePathToStoreImg(store_id, imagePath); // store_img 테이블에 이미지 경로 저장
			}
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
	public String saveMenuImage(MultipartFile mul) {
		return mfs.saveFile(mul);
	}
	public void saveImagePathToStoreImg(String store_id, String store_img_root) {		
		MainImgDTO dto = new MainImgDTO();
	    dto.setStore_id(store_id);
	    dto.setStore_img_root(store_img_root);
	    dto.setStore_img_main(1);
	    mapper.saveImagePathToStoreImg(dto);
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







