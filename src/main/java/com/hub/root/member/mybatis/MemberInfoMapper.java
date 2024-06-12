package com.hub.root.member.mybatis;

import org.apache.ibatis.annotations.Param;

public interface MemberInfoMapper {
	public int memberImgModify(@Param("fileName") String fileName,@Param("id") String id);
	public int memberImgDelete(String id);
	public int memberNickModify(@Param("nick") String nick, @Param("id") String id);
	public int memberStatusModify(@Param("status") String status, @Param("id") String id);

}
