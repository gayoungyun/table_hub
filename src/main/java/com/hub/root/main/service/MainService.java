package com.hub.root.main.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.hub.root.main.dto.MainDTO;

public interface MainService {
	public void infoSave(MultipartFile mul,String store_id,String store_menu_name,int store_menu_price,String store_menu_detail,String store_menu_category);
	public void mainPage1(Model model);
}
