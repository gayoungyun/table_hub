package com.hub.root.businessM.mybatis;

import org.apache.ibatis.annotations.Param;


import com.hub.root.businessM.DTO.businMDTO;

public interface businMMapper {	
	public businMDTO businMChk(@Param("store_id")String store_id);
	public int register(businMDTO dto);
	public int storeImage(String store_id, String file01, String file02, String file03, String file04, String file05);
}
