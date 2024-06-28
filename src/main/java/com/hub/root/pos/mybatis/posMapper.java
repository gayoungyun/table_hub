package com.hub.root.pos.mybatis;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.PosDTO;
import com.hub.root.pos.posDTO.keyDTO;
import com.hub.root.pos.posDTO.updateStatusDTO;

public interface PosMapper {
	public PosDTO login_chk(@Param("id") String id, @Param("pwd") String pwd);
	public List<BookingDTO>todayReservation(@Param("store_id") String store_id);
	public int bookingStatus(@Param("booking_id") int booking_id, @Param("booking_status") int booking_status);
	public int register_booking(BookingDTO bookingDTO);
	public int check_booking_maxNum();
	
	public int totalRegisterCount(@Param("store_id") String store_id, @Param("member_id") String member_id);
	public int key(keyDTO key);
	
	public List<keyDTO> getAllKey(@Param("userId") String userId);
	public keyDTO wait_keyCheck(@Param("key") String key);
	public void update_keyStatus(@Param("store_key") String store_key);
}
