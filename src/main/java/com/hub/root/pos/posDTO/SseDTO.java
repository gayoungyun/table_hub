package com.hub.root.pos.posDTO;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public class SseDTO {
	String User_Id;
	SseEmitter emitter;

	public String getUser_Id() {
		return User_Id;
	}
	public void setUser_Id(String user_Id) {
		User_Id = user_Id;
	}
	public SseEmitter getEmitter() {
		return emitter;
	}
	public void setEmitter(SseEmitter emitter) {
		this.emitter = emitter;
	}


}
