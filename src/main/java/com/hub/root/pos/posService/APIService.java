package com.hub.root.pos.posService;

import java.util.List;

import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.keyDTO;
import com.hub.root.pos.posDTO.updateStatusDTO;
import com.hub.root.pos.posDTO.waitDTO;

public interface APIService {
	public List<BookingDTO> todayReservation(String userID);
	public int bookingStatus(updateStatusDTO updateStatus);
	public BookingDTO updateSseDTO(BookingDTO bookingDTO);
	public keyDTO key(keyDTO key);
	public List<keyDTO> getAllKey(String userId);
	public int delete_key(keyDTO key);
	public String findStoreId(String key);
	
	public int registerWait(String name, String person_num, String store_id);
	public List<waitDTO> todayWait(String store_id);
}
