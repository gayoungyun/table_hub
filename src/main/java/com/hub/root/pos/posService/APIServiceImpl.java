package com.hub.root.pos.posService;

import java.security.SecureRandom;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.root.pos.mybatis.PosMapper;
import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.keyDTO;
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
				
				int count = totalRegisterCount(store_id, today.get(i).getMember_id());
				today.get(i).setReview_count(count);
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
	
	private int totalRegisterCount(String store_id, String member_id)
	{
		int result = 0;
		result = mapper.totalRegisterCount(store_id, member_id);
		
		return result;
	}

	@Override
	public BookingDTO updateSseDTO(BookingDTO bookingDTO) {
		
		BookingDTO dto = new BookingDTO();
		dto.setReview_count(mapper.totalRegisterCount(bookingDTO.getStore_id(), bookingDTO.getMember_id()));
		
		return dto;
	}

	
	public keyDTO key(keyDTO key) {
		String makeKey = makekey(10, false);
		int result = 0;
		
		if(makeKey != null)
		{
			key.setStore_key(makeKey);
			key.setKey_status(0);

			result = mapper.key(key);
		}
		if(result == 1 )
			return key;
		else 
			return null;
	}
	
	public List<keyDTO> getAllKey(String userId) {
		List<keyDTO> result = mapper.getAllKey(userId);
		
		return result;
	}
	
	private String makekey(int length, boolean isUpperCase) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }
        return isUpperCase ? sb.toString() : sb.toString().toLowerCase();
	}
}
