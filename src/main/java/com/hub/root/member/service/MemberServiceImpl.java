package com.hub.root.member.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.hub.root.member.dto.MemberDTO;
import com.hub.root.member.mybatis.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
<<<<<<< HEAD
	

	@Autowired MemberMapper mapper;
	@Autowired JavaMailSender sender;

	@Override
	public int loginChk(String id, String pwd) {
		MemberDTO dto = mapper.loginChk(id, pwd);
		String msg;
		if (dto != null) {
			if (pwd.equals(dto.getPwd())) {
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
	
	
=======
	@Autowired MemberMapper mapper;
	@Autowired JavaMailSender sender;

	@Override
	public int loginChk(String id, String pwd) {
		MemberDTO dto = mapper.loginChk(id, pwd);
		String msg;
		if (dto != null) {
			if (pwd.equals(dto.getPwd())) {
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
>>>>>>> branch 'guhyeon' of git@github.com:gayoungyun/table_hub.git

}
