package com.hub.root.main.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.hub.root.main.dto.MainDTO;

public interface mainMapper {
	public int infoSave(MainDTO dto);
	public List<MainDTO> mainPage1(@Param("store_id") String store_id);
	//public List<MainDTO> search(List<String> store_id_list);
	public List<MainDTO> search(@Param("store_id") String store_id,
			@Param("store_menu_name") String store_menu_name,
			@Param("store_menu_category") String store_menu_category);
}
