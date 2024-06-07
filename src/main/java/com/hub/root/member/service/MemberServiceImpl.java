package com.hub.root.member.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hub.root.member.dto.MemberDTO;
import com.hub.root.member.mybatis.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	

	@Autowired MemberMapper mapper;
	@Autowired JavaMailSender sender;
	
	BCryptPasswordEncoder en;
	public MemberServiceImpl () {
		en = new BCryptPasswordEncoder();
	}

	@Override
	public int loginChk(String id, String pwd) {
		MemberDTO dto = mapper.loginChk(id, pwd);
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
	
	public String sendMsg(String msg, String url) {
		String message = "<script>alert('"+msg+"');";
		message += "location.href='"+url+"'</script>";
		return message;
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
	public int idChk(String id) {
		MemberDTO dto = mapper.idChk(id);
		int result;
		if (dto == null) {
			result = 0;
		} else {
			result = 1;
		}
		return result;
	}
	@Override
	public int nickChk(String nick) {
		MemberDTO dto = mapper.nickChk(nick);
		int result;
		if (dto == null) {
			result = 0;
		} else {
			result = 1;
		}
		return result;
	}

	@Override
	public int mailChk(String email) {
		MemberDTO dto = mapper.mailChk(email);
		int result;
		if (dto == null) {
			result = 0;
		} else {
			result = 1;
		}
		return result;
	}
	
	public int register(MemberDTO dto) {
		System.out.println("서비스시작asdf");
		dto.setPwd(en.encode(dto.getPwd()));
		dto.setDateCreate(setTime());
		dto.setImg("default.img");
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
	

}
