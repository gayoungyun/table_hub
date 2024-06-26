package com.hub.root.member.service.info;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hub.root.member.dto.BookingDTO;
import com.hub.root.member.dto.MemberDTO;

public interface MemberInfoService {
	public String IMAGE_REPO = "C:/spring/img/member";
	public int memberImgModify(MultipartHttpServletRequest file, String id, String imgName);
	public String memberImgDelete(String imgName, String id);
	public String memberNickModify(String nick, String id);
	public String memberStatusModify(String status, String id);
	public String memberPhoneModify(String phone, String id);
	public Map<String, Object> memberEmailModify(String email, String id);
	public Map<String, Object> memberPasswordModify(String currentPwd, String ChangePwd, String id);
	public MemberDTO getMemberInfo(String id);
	
	
	public String getStoreName(String storeId);
	public Map<String, Object> getReadyBooking(String page, String id);
	public Map<String, Object> getAlreadyBooking(String page, String id);
	public int deleteBooking(int bookId);
}
