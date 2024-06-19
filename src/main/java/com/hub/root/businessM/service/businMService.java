package com.hub.root.businessM.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.root.businessM.DTO.businMDTO;
import com.hub.root.businessM.mybatis.businMMapper;

@Service
public class businMService {
	private final businMMapper mapper;
	
	@Autowired
    public businMService(businMMapper mapper) {
        this.mapper = mapper;
    }
	
	public int register(businMDTO dto) {
		System.out.println("서비스 가동");
		int result = 0;
		try {
			result = mapper.register(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("mapper에서 나온 result : " + result);
		return result;
	}
}
