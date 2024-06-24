package com.hub.root.pos.posService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.root.pos.mybatis.PosMapper;
import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.updateStatusDTO;

@Service
public class APIServiceImpl implements APIService{
	
	@Autowired
	PosMapper mapper;
	
	@Override
	public List<BookingDTO> todayReservation(String store_id) {
		
		List<BookingDTO> today = mapper.todayReservation(store_id);
		
		if(today != null)
		{
			for(int i = 0; i < today.size(); i++)
			{
				String str[] = today.get(i).getBooking_date_booking().split(" ");
				today.get(i).setBooking_date_booking(str[0]);
			}
					
			return today;
		}
		else {
			return null;
		}
	}

	public int bookingStatus(updateStatusDTO updateStatus) {
		
		int result = mapper.bookingStatus(updateStatus.getBooking_id(), updateStatus.getBooking_status() );
		
		return result;
	}
	
}
