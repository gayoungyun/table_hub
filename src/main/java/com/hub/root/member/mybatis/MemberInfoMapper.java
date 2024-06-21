package com.hub.root.member.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hub.root.member.dto.BookingDTO;
import com.hub.root.member.dto.MemberDTO;

public interface MemberInfoMapper {
	public int memberImgModify(@Param("fileName") String fileName,@Param("id") String id);
	public int memberImgDelete(String id);
	public int memberNickModify(@Param("nick") String nick, @Param("id") String id);
	public int memberStatusModify(@Param("status") String status, @Param("id") String id);
	public int memberPhoneModify(@Param("phone") String phone, @Param("id") String id);
	public int memberEmailModify(@Param("email") String email, @Param("id") String id);
	public String memberPasswordChk(String id);
	public int memberPasswordModify(@Param("pwd") String pwd, @Param("id") String id);
	public MemberDTO getMemberInfo(String id);
	
	public List<BookingDTO> getMyBooking(String id);
	public String getStoreName(String storeId);
	public int getBookingReadyCount(String id);
	public int getBookingAlreadyCount(String id);
	public List<BookingDTO> getBookingReadyContent(@Param("id") String id, 
							@Param("start") int start, 
							@Param("end") int end);
	public List<BookingDTO> getBookingAlreadyContent(@Param("id") String id, 
			@Param("start") int start, 
			@Param("end") int end);
	public int deleteBooking(int bookId);
}
