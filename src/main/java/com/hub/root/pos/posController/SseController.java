package com.hub.root.pos.posController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posService.PosService;
import com.hub.root.pos.posService.SseService;

@RestController
@RequestMapping("con")
public class SseController {
	
	@Autowired
	SseService sseService;
	
	@Autowired
	PosService service;
	
	@GetMapping(value="connect", produces=MediaType.TEXT_EVENT_STREAM_VALUE)
	public ResponseEntity<SseEmitter> connect(@RequestParam("articleId") String articleId){
		System.out.println("SseController 연결!!!!");
	    SseEmitter emitter = sseService.connect(articleId);
	    return ResponseEntity.ok(emitter);
	}
	
	@PostMapping("/book")
	public ResponseEntity<Void> sendComment(@RequestBody BookingDTO bookingDTO) {
		int booking_id = service.register_booking(bookingDTO);
		
		if(booking_id != 0)
		{
			int check_booking_maxNum = service.check_booking_maxNum();
					
			bookingDTO.setBooking_id(check_booking_maxNum);
			sseService.booking(bookingDTO);
		}
	    return ResponseEntity.ok().build();
	}
	
}
