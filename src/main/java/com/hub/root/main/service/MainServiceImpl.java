package com.hub.root.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hub.root.main.dto.MainDTO;
import com.hub.root.main.mybatis.mainMapper;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	mainMapper mapper;
	public int inputInfo(MainDTO dto) {
		try {
			return mapper.inputInfo(dto);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}	
	}
	public void mainPage1(Model model) {
		model.addAttribute("dto", mapper.mainPage1());
	}
}
