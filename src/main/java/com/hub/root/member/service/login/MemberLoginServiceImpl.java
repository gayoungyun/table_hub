package com.hub.root.member.service.login;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hub.root.member.dto.MemberDTO;
import com.hub.root.member.dto.StoreDTO;
import com.hub.root.member.mybatis.MemberMapper;

@Service
public class MemberLoginServiceImpl implements MemberLoginService{
	
	@Autowired MemberMapper mapper;
	@Autowired JavaMailSender sender;
	
	BCryptPasswordEncoder en;
	public MemberLoginServiceImpl () {
		en = new BCryptPasswordEncoder();
	}

	@Override
	public int loginChk(String id, String pwd) {
		MemberDTO dto = mapper.loginChk(id);
		if (dto != null) {
			if (en.matches(pwd, dto.getPwd())) {
				if (dto.getAdmin() == 1) {
					return 2;
				}
				return 1;
			}
		}
		
		return 0;
	}

	@Override
	public int mailChk(String email) {
		System.out.println("11");
		System.out.println("email : " + email);
		ArrayList<MemberDTO> list = mapper.mailChk(email);
		System.out.println("22");
		int result;
		if (list.isEmpty()) {
			result = 0;
		} else {
			result = 1;
		}
		return result;
	}
	
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = sender.createMimeMessage();
		
		try {
			MimeMessageHelper h = new MimeMessageHelper(message, true, "UTF-8");
			h.setSubject(subject);
			h.setTo(to);
			h.setText(body);
			sender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	public int snsLoginChk(String id) {
		MemberDTO dto = mapper.loginChk(id);
		if (dto == null) {
			return 0;
		} else {
			return 1;
		}
	}
	
	public int register(MemberDTO dto) {
		System.out.println("서비스시작asdf");
		dto.setPwd(en.encode(dto.getPwd()));
		dto.setDateCreate(setTime());
		dto.setImg("default.jpg");
		dto.setStatus("안녕하세요 저는 "+dto.getNick()+" 입니다.");
		System.out.println(dto.getStatus());
		int result = mapper.register(dto);
		return result;
	}
	
	public String setTime() {
		LocalDateTime currentTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedTime = currentTime.format(formatter);
		
        return formattedTime;
	}

	@Override
	public int storeLoginChk(String inputId, String inputPwd) {
		System.out.println("서비스실행");
		String pwd = mapper.storeLoginChk(inputId);
		System.out.println(pwd);
		int result = 0;
		if (en.matches(inputPwd, pwd)) {
			result = 1;
		}
		return result;
	}

	@Override
	public Map<String, Object> storeNumChk(String storeId) {
		System.out.println("storeId : " + storeId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", mapper.storeChk(storeId));
		System.out.println("result : "+ map.get("result"));
		if ((int)map.get("result") == 1) {
			map.put("msg", "이미 등록되어있는 사업자번호입니다.");
		} else {
			int result = mapper.storeNumChk(storeId);
			if (result != 1) {
				map.put("result", -1);
				map.put("msg", "등록되어있지 않는 사업자번호입니다.");
			} else {
				map.put("result", 0);
				map.put("msg", "가입 가능한 사업자번호입니다. <br>이메일 인증후 회원가입 진행해주세요");
			}
		}
		return map;
	}

	@Override
	public int storeMailChk(String email) {
		int result = mapper.storeMailChk(email);
		return result;
	}
	
	
	

}
