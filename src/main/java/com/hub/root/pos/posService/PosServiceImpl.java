package com.hub.root.pos.posService;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.hub.root.pos.mybatis.PosMapper;
import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.KeyDTO;
import com.hub.root.pos.posDTO.PosDTO;

@Service
public class PosServiceImpl implements PosService {

	@Autowired
	PosMapper mapper;
	public static final String TABLE_HUB_REPO = "C:/spring/table_hub";

	public BCryptPasswordEncoder en;

	public PosServiceImpl() {
		en = new BCryptPasswordEncoder();
	}

	@Override
	public int login_chk(HttpServletRequest req,
			String id,
			String pwd) {

		PosDTO dto =  mapper.login_chk(id, pwd);

		if(dto != null)
		{
			if (en.matches(pwd, dto.getStore_pwd())) {
				HttpSession session = req.getSession();
				session.setAttribute("UserID", dto.getStore_id());
				session.setAttribute("UserName", dto.getStore_name());
				session.removeAttribute("key");
				return 1;
			}
		}
		return 0;
	}

	@Override
	public int upload_store_file(MultipartFile file, HttpSession session) {

		if(session.getAttribute("UserID") != null && !file.isEmpty())
		{
			File saveFile = new File(TABLE_HUB_REPO + "/" + session.getAttribute("UserID") + ".jsp");
			try {
				if(saveFile.exists())
				{
					saveFile.delete();
				}
				file.transferTo(saveFile);

			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		return 0;
	}

	@Override
	public int register_booking(BookingDTO bookingDTO) {

		int result = mapper.register_booking(bookingDTO);

		return result;
	}

	@Override
	public int check_booking_maxNum() {
		int result = mapper.check_booking_maxNum();


		return result;
	}

	@Override
	public int wait_keyCheck(HttpServletRequest req, String key) {
		KeyDTO result = mapper.wait_keyCheck(key);

		System.out.println(result.getStore_key());

		if(result != null)
		{
			HttpSession session = req.getSession();
			session.setAttribute("store_id", result.getStore_id());
			session.setAttribute("store_name", result.getStore_name());
			session.setAttribute("key", result.getStore_key());
			session.removeAttribute("UserID");
			session.removeAttribute("UserName");
			update_keyStatus(key);
			return 1;
		}

		return 0;
	}

	private void update_keyStatus(String key) {
		mapper.update_keyStatus(key);
	}

	@Override
	public byte[] qrCode(String link) throws IOException, WriterException {

		Map<EncodeHintType, Object> hintMap = new HashMap<>();
		hintMap.put(EncodeHintType.MARGIN, 0);
		hintMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");

		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		BitMatrix bitMatrix = qrCodeWriter.encode(link, BarcodeFormat.QR_CODE, 200, 200, hintMap);

		BufferedImage qrCodeImage = MatrixToImageWriter.toBufferedImage(bitMatrix);

		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		ImageIO.write(qrCodeImage, "png", byteArrayOutputStream);
		byteArrayOutputStream.flush();

		byte[] qrCodeBytes = byteArrayOutputStream.toByteArray();
		byteArrayOutputStream.close();

		return qrCodeBytes;
	}



}
