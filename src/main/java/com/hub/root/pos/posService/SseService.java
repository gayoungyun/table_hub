package com.hub.root.pos.posService;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter.SseEventBuilder;

import com.hub.root.pos.posDTO.BookingDTO;

@Service
public class SseService {
	
	private final List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	private final List<String> userId = new CopyOnWriteArrayList<>();
	
	public SseEmitter connect(final String articleId) {
		SseEmitter sseEmitter = new SseEmitter(300_000L);

		final SseEventBuilder sseEventBuilder = SseEmitter.event().name("connect").data("connected!")
				.reconnectTime(0);

		sendEvent(sseEmitter, sseEventBuilder);
		
		this.emitters.add(sseEmitter);
		this.userId.add(articleId);
		

		sseEmitter.onCompletion(() -> {
			int index = emitters.indexOf(sseEmitter);
			emitters.remove(sseEmitter);
			userId.remove(index);
		});
		return sseEmitter;
	}

	private static void sendEvent(final SseEmitter sseEmitter, final SseEventBuilder sseEventBuilder) {
		try {
			System.out.println("sseEmitter(send 직전) : " + sseEmitter);
			System.out.println("sseEventBuilder : " + sseEventBuilder);
			sseEmitter.send(sseEventBuilder);
		} catch (IOException e) {
			System.out.println("여기 에러??");
			sseEmitter.complete();
		}
	}

	public void booking(final BookingDTO bookingDTO) {
		
		int si = emitters.size();
		
		for(int i = 0; i < si - 1; i++)
		{
			if(emitters.get(i) == emitters.get(i + 1))
			{
				emitters.remove(i);
				userId.remove(i);
			}
		}
		
		final SseEventBuilder sseEventBuilder = SseEmitter.event().name("newBooking").data(bookingDTO)
				.reconnectTime(0);
					
		emitters.forEach((value) -> {
			int index = emitters.indexOf(value);
			if(bookingDTO.getStore_id().equals(userId.get(index))) {
				sendEvent(value, sseEventBuilder);	
			}
		});
	}
	
	//private void check
	
}