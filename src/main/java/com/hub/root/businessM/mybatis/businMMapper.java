package com.hub.root.businessM.mybatis;

import org.apache.ibatis.annotations.Param;

import com.hub.root.businessM.DTO.businMDTO;

public interface businMMapper {	
	public businMDTO businMChk(@Param("store_id")String store_id);
	public int register(businMDTO dto);
}
