package com.hub.root.member.service;

import com.hub.root.member.dto.MemberDTO;

public interface MemberService {
	public int loginChk(String id, String pwd);
	public void sendMail(String to, String subject, String body);
	public int idChk(String id);
	public int nickChk(String nick);
	public int mailChk(String email);
	public int register(MemberDTO dto);
	public int snsLoginChk(String id);
	public MemberDTO getMemberInfo(String id);
}
