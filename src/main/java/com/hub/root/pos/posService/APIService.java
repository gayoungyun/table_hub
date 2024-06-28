package com.hub.root.pos.posService;

import java.util.List;

import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.keyDTO;
import com.hub.root.pos.posDTO.updateStatusDTO;

public interface APIService {
	public List<BookingDTO> todayReservation(String userID);
	public int bookingStatus(updateStatusDTO updateStatus);
	public BookingDTO updateSseDTO(BookingDTO bookingDTO);
	public keyDTO key(keyDTO key);
	public List<keyDTO> getAllKey(String userId);
}
