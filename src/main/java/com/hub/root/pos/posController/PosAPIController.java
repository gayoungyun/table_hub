package com.hub.root.pos.posController;

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
import com.hub.root.pos.posDTO.KeyDTO;
import com.hub.root.pos.posDTO.UpdateStatusDTO;
import com.hub.root.pos.posDTO.WaitDTO;
import com.hub.root.pos.posService.PosAPIService;

@RestController
@RequestMapping("api")
public class PosAPIController {

	@Autowired
	PosAPIService apiService;

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
	public int bookingStatus(@RequestBody UpdateStatusDTO updateStatus) {
		System.out.println(updateStatus.getBooking_id());

		int result = apiService.bookingStatus(updateStatus);

		return result;
	}

	@PostMapping("bookingCount")
	public BookingDTO updateSseDTO(@RequestBody BookingDTO bookingDTO) {
		BookingDTO dto = apiService.updateSseDTO(bookingDTO);

		return dto;
	}

	@GetMapping("key1")
	public List<KeyDTO> key_list(@RequestParam String userId){
		List<KeyDTO> result = null;

		result = apiService.getAllKey(userId);

		return result;
	}

	@PostMapping("key1")
	public KeyDTO key(@RequestBody KeyDTO key){

		KeyDTO result = apiService.key(key);
		return result;
	}


	@DeleteMapping("key1")
	public int delete_key(@RequestBody KeyDTO key) {
		int result = apiService.delete_key(key);

		return result;
	}

	@GetMapping("todayWait")
	public List<WaitDTO> todayWait(@RequestHeader("store_id") String store_id ) {
		List<WaitDTO> dto = apiService.todayWait(store_id);

		return dto;
	}

	@PatchMapping("wait1")
	public void wait(@RequestBody WaitDTO wait) {
		System.out.println("왜 안나와??? : " + wait.getWait_time());
		apiService.wait123(wait.getStore_id(), wait.getWait_time(), wait.getWait_num());
			
	}

	@GetMapping("averageTime1")
	public String averageTime(@RequestHeader("store_id") String store_id) {

		String result = "null";
		result = apiService.averageTime(store_id);

		return result;
	}

	@GetMapping("nowWaitNum")
	public String nowWaitNum(@RequestHeader("store_id") String store_id) {
		String result = "null";
		result = apiService.nowWaitNum(store_id);

		return result;
	}

}
