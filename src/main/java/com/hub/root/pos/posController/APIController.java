package com.hub.root.pos.posController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.updateStatusDTO;
import com.hub.root.pos.posService.APIService;

@RestController
@RequestMapping("api")
public class APIController {
	
	@Autowired
	APIService apiService;
	
	@GetMapping("todayReservation")
	public List<BookingDTO> todayReservation(HttpSession session) {
		String userId = session.getAttribute("UserID").toString(); 
		List<BookingDTO> today = null;
		
		if(userId != null)
		{
			today = apiService.todayReservation(userId);
		}
		
		return today;	
	}
	
	@PatchMapping("bookingStatus")
	public int bookingStatus(@RequestBody updateStatusDTO updateStatus) {
		System.out.println(updateStatus.getBooking_id());
		
		int result = apiService.bookingStatus(updateStatus);
		
		return result;
	}
}
