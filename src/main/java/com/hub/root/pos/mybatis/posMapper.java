package com.hub.root.pos.mybatis;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.PosDTO;

public interface PosMapper {
	public PosDTO login_chk(@Param("id") String id, @Param("pwd") String pwd);
	public int register_booking(BookingDTO bookingDTO);
	public List<BookingDTO>todayReservation(@Param("store_id") String store_id);
}
