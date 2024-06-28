package com.hub.root.main.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.hub.root.main.dto.MainDTO;
import com.hub.root.main.dto.MainMapDTO;

public interface MainService {
	public List<MainDTO> mainPage1(Model model);
	public List<String> getAllCategories();
	public List<MainDTO> getMenuByCategory(String category);
	public List<MainMapDTO> getStoreInfo(Map<String, Object> params);
	public List<MainMapDTO> getStoreInfoByCategory(String category);
	public List<MainDTO> getMenuImage(Map<String, Object> params);
	
	public void infoSave(MultipartFile mul,String store_id,String store_menu_name,int store_menu_price,String store_menu_detail,String store_menu_category);
	public void storeSave(String store_id,String store_pwd,String store_email,String store_phone,String store_main_phone,String store_name,String store_add,
			String store_add_info,String store_category,String store_note,String store_introduce,String store_business_hours);
}