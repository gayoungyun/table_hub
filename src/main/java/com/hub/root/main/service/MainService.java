package com.hub.root.main.service;

import org.springframework.ui.Model;

import com.hub.root.main.dto.MainDTO;

public interface MainService {
	public int inputInfo(MainDTO dto);
	public void mainPage1(Model model);
}
