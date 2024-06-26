package com.hub.root.main.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.hub.root.main.dto.MainDTO;
import com.hub.root.main.dto.MainMapDTO;

public interface mainMapper {
	public int infoSave(MainDTO dto);
	public List<MainDTO> mainPage1();
	public List<MainDTO> search(@Param("params") Map<String, Object> params);
	//public MainMapDTO getStoreInfo(String store_id);
	public List<MainMapDTO> getStoreInfo();
	public void mainPage2(MainMapDTO MapDTO);
	public void storeSave(MainMapDTO dto);
}
