package com.hub.root.pos.posService;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hub.root.pos.mybatis.PosMapper;
import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.PosDTO;

@Service
public class PosServiceImpl implements PosService {
	
	@Autowired
	PosMapper mapper;
	public static final String TABLE_HUB_REPO = "C:/spring/table_hub";
	
	public int login_chk(HttpServletRequest req,
			String id,
			String pwd) {

		PosDTO dto =  mapper.login_chk(id, pwd);
		
		if(dto != null)
		{
			HttpSession session = req.getSession();
			session.setAttribute("UserID", dto.getStore_id());
			session.setAttribute("UserName", dto.getStore_name());
			return 1;
		}
		return 0;
	}
	
	public int upload_store_file(MultipartFile file, HttpSession session) {
		
		if(session.getAttribute("UserID") != null && file.isEmpty() == false)
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
	
}
