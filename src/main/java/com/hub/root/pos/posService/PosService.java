package com.hub.root.pos.posService;

import javax.servlet.http.HttpServletRequest;

public interface PosService {
	
	public int login_chk(HttpServletRequest req, String id, String pwd);
}
