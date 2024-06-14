package com.hub.root.member.mybatis;

import org.apache.ibatis.annotations.Param;

public interface MemberInfoMapper {
	public int memberImgModify(@Param("fileName") String fileName,@Param("id") String id);
	public int memberImgDelete(String id);
	public int memberNickModify(@Param("nick") String nick, @Param("id") String id);
	public int memberStatusModify(@Param("status") String status, @Param("id") String id);
	public int memberPhoneModify(@Param("phone") String phone, @Param("id") String id);
	public int memberEmailModify(@Param("email") String email, @Param("id") String id);
	public String memberPasswordChk(String id);
	public int memberPasswordModify(@Param("pwd") String pwd, @Param("id") String id);
}
