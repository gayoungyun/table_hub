package com.hub.root.member.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hub.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO loginChk(@Param("id") String id);
	public MemberDTO idChk( String id );
	public MemberDTO nickChk( String nick );
	public ArrayList<MemberDTO> mailChk( String email );
	public int register(MemberDTO dto);
	public MemberDTO getMemberInfo(String id);
}
