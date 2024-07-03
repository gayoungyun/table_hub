package com.hub.root.pos.posController;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.keyDTO;
import com.hub.root.pos.posDTO.updateStatusDTO;
import com.hub.root.pos.posDTO.waitDTO;
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
	
	@PostMapping("bookingCount")
	public BookingDTO updateSseDTO(@RequestBody BookingDTO bookingDTO) {
		BookingDTO dto = apiService.updateSseDTO(bookingDTO);
		
		return dto;
	}
	
	@GetMapping("key")
	public List<keyDTO> key_list(@RequestParam String userId){
		List<keyDTO> result = null;
		
		result = apiService.getAllKey(userId);
		
		return result;
	}
	
	@PostMapping("key")
	public keyDTO key(@RequestBody keyDTO key){
	
		keyDTO result = apiService.key(key);
		return result; 
	}
	
	
	@DeleteMapping("key")
	public int delete_key(@RequestBody keyDTO key) {
		int result = apiService.delete_key(key);
		
		return result;
	}
	
	@GetMapping("todayWait")
	public List<waitDTO> todayWait(@RequestHeader("store_id") String store_id ) {
		List<waitDTO> dto = apiService.todayWait(store_id);
		
		return dto;
		
	}
	
}
