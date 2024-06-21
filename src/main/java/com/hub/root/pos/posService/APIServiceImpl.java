package com.hub.root.pos.posService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.root.pos.mybatis.PosMapper;
import com.hub.root.pos.posDTO.BookingDTO;

@Service
public class APIServiceImpl implements APIService{
	
	@Autowired
	PosMapper mapper;
	
	@Override
	public List<BookingDTO> todayReservation(String store_id) {
		
		List<BookingDTO> today = mapper.todayReservation(store_id);
		
		if(today != null)
		{
			return today;
		}
		else {
			return null;
		}
	}
	
}
