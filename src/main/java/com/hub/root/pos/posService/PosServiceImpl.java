package com.hub.root.pos.posService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.root.pos.mybatis.PosMapper;
import com.hub.root.pos.posDTO.PosDTO;

@Service
public class PosServiceImpl implements PosService {
	
	@Autowired
	PosMapper mapper;
	
	
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
	
}
