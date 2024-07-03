package com.hub.root.member.service.login;

import java.util.Map;

import com.hub.root.member.dto.MemberDTO;

public interface MemberLoginService {
	public int loginChk(String id, String pwd);
	public int mailChk(String email);
	public int sendMailCode(String email);
	public int snsLoginChk(String id);
	
	public int storeLoginChk(String id, String pwd);
	public Map<String, Object> storeNumChk(String storeId);
	public int storeMailChk(String email);
	
	public Map<String, Object> sendMailId(String email);
}
