package com.hub.root.member.service;

public interface MemberService {
	public int loginChk(String id, String pwd);
	public void sendMail(String to, String subject, String body);
}
