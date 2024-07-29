package com.hub.root.pos.posService;

import java.util.List;

import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.KeyDTO;
import com.hub.root.pos.posDTO.UpdateStatusDTO;
import com.hub.root.pos.posDTO.WaitDTO;

public interface PosAPIService {
	public List<BookingDTO> todayReservation(String userID);
	public int bookingStatus(UpdateStatusDTO updateStatus);
	public BookingDTO updateSseDTO(BookingDTO bookingDTO);
	public KeyDTO key(KeyDTO key);
	public List<KeyDTO> getAllKey(String userId);
	public int delete_key(KeyDTO key);
	public String findStoreId(String key);

	public int registerWait(String name, String person_num, String store_id);
	public List<WaitDTO> todayWait(String store_id);

	public int wait(String Store_id, int wait_time, int wait_num);

	public String averageTime(String store_id);
	public String nowWaitNum(String store_id);
}
