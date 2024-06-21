package com.hub.root.pos.posService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.hub.root.pos.posDTO.BookingDTO;

public interface PosService {
	
	public int login_chk(HttpServletRequest req, String id, String pwd);
	public int upload_store_file(MultipartFile file, HttpSession session);
	public int register_booking(BookingDTO bookingDTO);
}
