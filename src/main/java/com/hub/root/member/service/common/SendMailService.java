package com.hub.root.member.service.common;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class SendMailService {

	@Autowired JavaMailSender sender;
	

	
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
	
	
}
