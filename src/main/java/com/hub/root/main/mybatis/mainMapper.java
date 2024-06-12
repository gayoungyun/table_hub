package com.hub.root.main.mybatis;

import java.util.ArrayList;

import com.hub.root.main.dto.MainDTO;

public interface mainMapper {
	public int inputInfo(MainDTO dto);
	public ArrayList<MainDTO> mainPage1();
}
