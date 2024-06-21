package com.hub.root.member.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MemberInfoService {
	public String IMAGE_REPO = "C:/spring/img/member";
	public int memberImgModify(MultipartHttpServletRequest file, String id, String imgName);
	public String memberImgDelete(String imgName, String id);
	public String memberNickModify(String nick, String id);
	public String memberStatusModify(String status, String id);
	public String memberPhoneModify(String phone, String id);
	public Map<String, Object> memberEmailModify(String email, String id);
	public Map<String, Object> memberPasswordModify(String currentPwd, String ChangePwd, String id);
}
