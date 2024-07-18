package com.hub.root.businessM.mybatis;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.hub.root.businessM.DTO.businMDTO;

public interface businMMapper {	
	public businMDTO businMChk(@Param("store_id")String store_id);
	public int register(businMDTO dto);
	//public int storeImage01(@Param("file01Path") String file01Path, @Param("store_id")String store_id);
	//public int storeImage09(@Param("filePath")String filePath, @Param("store_id")String store_id);
	public int storeImage01( Map<String, Object> param );
	public businMDTO infochk(String store_id);
}
