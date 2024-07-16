package com.hub.root.pos.posService;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.WriterException;
import com.hub.root.pos.posDTO.BookingDTO;

public interface PosService {

	public int login_chk(HttpServletRequest req, String id, String pwd);
	public int upload_store_file(MultipartFile file, HttpSession session);
	public int register_booking(BookingDTO bookingDTO);
	public int check_booking_maxNum();
	public int wait_keyCheck(HttpServletRequest req, String key);
	public byte[] qrCode(String link) throws IOException, WriterException;
}
