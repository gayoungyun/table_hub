package com.hub.root.pos.socket;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
@RequestMapping("/send")
public class EchoHandler extends TextWebSocketHandler{
	
	// 로그인중인 개별유저 - 사업자 번호 키값
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	// 대기 등록하는 페이지 개별 세션 -  만들어둔 키값 이 키값
	Map<String, WebSocketSession> wait_users = new ConcurrentHashMap<String, WebSocketSession>();
	// 만들어둔 키값, 사업자 번호 순
	Map<String, String> matching_users = new ConcurrentHashMap<String, String>();
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getMemberId(session); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
		String waiterId[] = getWaitMemberKey(session);
		
		System.out.println(waiterId);
		
		if(senderId!=null) {	// 로그인 값이 있는 경우만
			log(senderId + " 연결 됨");
			users.put(senderId, session);   // 로그인중 개별유저 저장
		}
		else if(waiterId != null) {
			log(waiterId[0] + " key 연결 됨");
			wait_users.put(waiterId[0], session);
			matching_users.put(waiterId[0], waiterId[1]);
		}
		
	}
	// 클라이언트가 Data 전송 시
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			String senderId = getMemberId(session);
			// 특정 유저에게 보내기
			String msg = message.getPayload();
			if(msg != null) {
				String[] strs = msg.split(",");
				log(strs.toString());
				if(strs != null && strs.length == 4) {
					String type = strs[0];
					String target = strs[1]; // m_id 저장
					String content = strs[2];
					String url = strs[3];
					WebSocketSession targetSession = users.get(target);  // 메시지를 받을 세션 조회
					
					// 실시간 접속시
					if(targetSession!=null) {
						// ex: [&분의일] 신청이 들어왔습니다.
						TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + type + "</b>] " + content + "</a>" );
						targetSession.sendMessage(tmpMsg);
					}
				}
			}
		}
	
	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderId = getMemberId(session);
		String waiterId[] = getWaitMemberKey(session);
		if(senderId!=null) {	// 로그인 값이 있는 경우만
			log(senderId + " 연결 종료됨");
			users.remove(senderId);
		}
		else if(waiterId != null) {
			log(waiterId[0] + " key 종료됨");
			wait_users.remove(waiterId[0]);
			matching_users.remove(waiterId[0]);
		}
	}

	// 로그 메시지
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	
	// 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private String getMemberId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String m_id = (String) httpSession.get("UserID"); // 세션에 저장된 m_id 기준 조회
		return m_id==null? null: m_id;
	}
	
	private String[] getWaitMemberKey(WebSocketSession session){
		Map<String, Object> httpSession = session.getAttributes();
		String key = (String) httpSession.get("key"); // 세션에 저장된 m_id 기준 조회
		String store_id = (String) httpSession.get("store_id");
		
		String arr[] = {key, store_id};
		
		return arr;
	}
}
