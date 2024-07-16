package com.hub.root.pos.posService;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter.SseEventBuilder;

import com.hub.root.pos.posDTO.BookingDTO;

@Service
public class SseService {

	private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();

	public SseEmitter connect(final String articleId) {
		SseEmitter sseEmitter = new SseEmitter(300_000L);

		final SseEventBuilder sseEventBuilder = SseEmitter.event().name("connect").data("connected!")
				.reconnectTime(0);

		sendEvent(sseEmitter, sseEventBuilder);

		sseEmitter.onCompletion(() -> {
			emitters.remove(articleId);
		});
		sseEmitter.onError((ex) -> {
			emitters.remove(articleId);
		});

		emitters.put(articleId, sseEmitter);

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

		final SseEventBuilder sseEventBuilder = SseEmitter.event().name("newBooking").data(bookingDTO)
				.reconnectTime(0);

		SseEmitter sse = findStore(bookingDTO.getStore_id());

		if( sse != null)
		{
			sendEvent(sse, sseEventBuilder);
		}
	}

	private SseEmitter findStore(String store_id) {

		if(emitters.get(store_id) != null)
		{
			return emitters.get(store_id);
		}
		else
		{
			return null;
		}
	}

}