package com.hub.root.pos.mybatis;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.KeyDTO;
import com.hub.root.pos.posDTO.PosDTO;
import com.hub.root.pos.posDTO.WaitDTO;

public interface PosMapper {
	public PosDTO login_chk(@Param("id") String id, @Param("pwd") String pwd);
	public List<BookingDTO>todayReservation(@Param("store_id") String store_id);
	public int bookingStatus(@Param("booking_id") int booking_id, @Param("booking_status") int booking_status);
	public int register_booking(BookingDTO bookingDTO);
	public int check_booking_maxNum();

	public int totalRegisterCount(@Param("store_id") String store_id, @Param("member_id") String member_id);
	public int key(KeyDTO key);

	public List<KeyDTO> getAllKey(@Param("userId") String userId);
	public KeyDTO wait_keyCheck(@Param("key") String key);
	public void update_keyStatus(@Param("store_key") String store_key);
	public int delete_key(KeyDTO key);

	public String findStoreId(@Param("key") String key);
	public int registerWait(@Param("wait_num") int wait_num,  @Param("name") String name, @Param("person_num") String person_num, @Param("store_id") String store_id);

	public int wait_num();
	public List<WaitDTO> todayWait(@Param("store_id") String store_id);

	public void wait123(@Param("store_id") String store_id, @Param("wait_time") int wait_time, @Param("wait_num") int wait_num);
	public String[] averageTime(@Param("store_id") String store_id);

	public String nowWaitNum(@Param("store_id") String store_id);

}