package com.hub.root.member.mybatis;

import org.apache.ibatis.annotations.Param;

import com.hub.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO loginChk(@Param("id") String id,@Param("pwd") String pwd);
<<<<<<< HEAD
	public MemberDTO idChk( String id );
	public MemberDTO nickChk( String nick );
	public MemberDTO mailChk( String email );
=======

>>>>>>> branch 'guhyeon' of git@github.com:gayoungyun/table_hub.git
}
