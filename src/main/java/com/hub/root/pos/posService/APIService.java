package com.hub.root.pos.posService;

import java.util.List;

import com.hub.root.pos.posDTO.BookingDTO;

public interface APIService {
	public List<BookingDTO> todayReservation(String userID);
}
