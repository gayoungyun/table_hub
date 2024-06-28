package com.hub.root.main.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.hub.root.main.dto.MainDTO;
import com.hub.root.main.dto.MainMapDTO;

public interface mainMapper {
	public List<MainDTO> mainPage1();
	public List<String> getAllCategories();
	public List<MainDTO> getMenuByCategory(@Param("category") String category);
	public void mainPage2(MainMapDTO MapDTO);
	public List<MainMapDTO> getStoreInfo(@Param("params") Map<String, Object> params);
	public List<MainMapDTO> getStoreInfoByCategory(@Param("category") String category);
	public List<MainDTO> getMenuImage(Map<String, Object> params);
	
	public int infoSave(MainDTO dto);
	public void storeSave(MainMapDTO dto);
}
