package com.hub.root.pos.socket;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.hub.root.pos.posService.PosAPIService;

@Component
@RequestMapping("/send")
public class EchoHandler extends TextWebSocketHandler{
	@Autowired
	PosAPIService apiService;

	//*************** 추후 수정 *******************
	// 로그인중인 개별유저 - 사업자 번호 키값
	Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	// 대기 등록하는 페이지 개별 세션 -  만들어둔 키값 이 키값
	Map<String, WebSocketSession> wait_users = new ConcurrentHashMap<>();
	// 만들어둔 키값, 사업자 번호 순
	Map<String, String> matching_users = new ConcurrentHashMap<>();
	//*************** 추후 수정 *******************

	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String waiterId[] = getWaitMemberKey(session);

		System.out.println(waiterId);

		if(waiterId != null ) {

			if(waiterId[0] == null)
			{
				log(waiterId[1] + " 연결 됨");
				users.put(waiterId[1], session);
			}
			else {

				if(users.get(waiterId[1]) == null)
				{
					TextMessage tmpMsg = new TextMessage("-1" + "," + "");
					session.sendMessage(tmpMsg);
					return ;
				}
				log(waiterId[0] + " key 연결 됨");
				wait_users.put(waiterId[0], session);
				matching_users.put(waiterId[0], waiterId[1]);
			}
		}
	}
	// 클라이언트가 Data 전송 시
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			// 특정 유저에게 보내기
			String msg = message.getPayload();

			if(msg != null) {
				String[] str = msg.split(",");

				if(str != null && str.length == 4)
				{
					String name = str[0];
					String person_num = str[1];
					String sender = str[2];
					String store_id = str[3];

					if(sender.equals("0"))
					{
						String[] senderId = getWaitMemberKey(session);
						System.out.println("senderId[0] : " + senderId[0]); // 대기 등록쪽
						System.out.println("senderId[1] : " + senderId[1]); // 예약쪽

						// 대기 번호
						int result = apiService.registerWait(name, person_num, store_id);

						WebSocketSession targetSession = users.get(senderId[1]);

						if(targetSession != null)
						{
							TextMessage tmpMsg = new TextMessage(result + "," + name + "," + person_num );
							targetSession.sendMessage(tmpMsg);
						}

						String[] getKey = getKey(matching_users, store_id);
						WebSocketSession targetConSession = null;

						for(int i = 0; i < getKey.length && getKey[i] != null; i++)
						{
							// 받는 쪽에서 식별하기 위해 0추가
							// (0이면 데이터를 보내고 받았다는 의미, 1이면 입장 한다는 의미, 2이면 취소한다는 의미)
							TextMessage tmpMsg = new TextMessage(0 + "," + result + "," + name + "," + person_num + "," + senderId[0]);
							targetConSession = wait_users.get(getKey[i]);
							targetConSession.sendMessage(tmpMsg);
						}
					}
				}
				else if(str[0].equals("1"))
				{
					String store_id = str[1];
					String wait_num = str[2];
					String[] getKey = getKey(matching_users, store_id);

					WebSocketSession targetConSession = null;
					for(int i = 0; i < getKey.length && getKey[i] != null; i++)
					{
						// 받는 쪽에서 식별하기 위해 1추가
						// (0이면 데이터를 보내고 받았다는 의미, 1이면 입장 한다는 의미, 2이면 취소한다는 의미)
						TextMessage tmpMsg = new TextMessage(1 + "," + wait_num);
						targetConSession = wait_users.get(getKey[i]);
						targetConSession.sendMessage(tmpMsg);
					}
				}
			}
		}

	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String waiterId[] = getWaitMemberKey(session);
		if(waiterId != null ) {

			if(waiterId[0] == null)
			{
				log(waiterId[1] + "종료됨");
				users.remove(waiterId[1]);
			}
			else {
				log(waiterId[0] + " key 종료됨");
				wait_users.remove(waiterId[0]);
				matching_users.remove(waiterId[0]);
			}
		}
	}

	// 로그 메시지
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

	// 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private String[] getWaitMemberKey(WebSocketSession session){
		Map<String, Object> httpSession = session.getAttributes();
		String key = (String) httpSession.get("key"); // 세션에 저장된 m_id 기준 조회
		String store_id = null;
		if(key == null)
		{
			store_id = (String) httpSession.get("UserID");
		}
		else {
			store_id = (String) httpSession.get("store_id");

		}

		String arr[] = {key, store_id};

		return arr;
	}

	private String[] getKey(Map<String, String> map, String value) {

		String[] arr = new String[3];
		System.out.println(arr);
		int count = 0;
		for(String key : map.keySet()) {
			if(value.equals(map.get(key))) {
				arr[count] = key;
				count++;
			}
		}
		return arr;
	}
}
