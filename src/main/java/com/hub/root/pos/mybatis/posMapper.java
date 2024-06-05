package com.hub.root.pos.mybatis;



import org.apache.ibatis.annotations.Param;

import com.hub.root.pos.posDTO.PosDTO;

public interface PosMapper {
	public PosDTO login_chk(@Param("id") String id, @Param("pwd") String pwd);
}
