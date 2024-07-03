package com.hub.root.member.service.login;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hub.root.member.dto.MemberDTO;
import com.hub.root.member.dto.StoreDTO;
import com.hub.root.member.mybatis.MemberMapper;
import com.hub.root.member.service.common.RandomCodeService;
import com.hub.root.member.service.common.SendMailService;

@Service
public class MemberLoginServiceImpl implements MemberLoginService{
	
	@Autowired MemberMapper mapper;
	@Autowired RandomCodeService rcs;
	@Autowired SendMailService mail;
	
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
	
	public int sendMailCode(String email) {
		int code = rcs.randomNumber();
		String msg = "인증번호는 [" + code + "] 입니다. \n 해당 코드를 입력해주세요";
		String title = "인증번호를 확인해주세요";
		
		mail.sendMail(email, title, msg);
//		 받는사람 이메일, 제목, 내용 순으로 넘겨준다.
		
		return code;
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

	@Override
	public Map<String, Object> sendMailId(String email) {
		System.out.println("MemLoginSer sendMailId 실행");
		Map<String, Object> map = new HashMap<String, Object>();
		String[] memberIds = mapper.getMemId(email);
		String memberId = "";
		String msg = "";
		if (memberIds.length == 0) {
			System.out.println("if 실행");
			msg = "가입되지 않은 이메일 주소입니다. \n확인후 다시 시도해주세요";
			map.put("result", 0);
		} else if (memberIds.length > 1) { // 간편로그인이 있을 경우 이메일 중복가능성이 있음
			System.out.println("elseif 실행");
			
			for (int i = 0; i < memberIds.length; i++) {
				String[] check = memberIds[i].split("_");
				if (check[0] != "N") {
					memberId = memberIds[i];
					break;
				}
			}
			msg = "이메일로 아이디가 전송되었으니 확인 후 로그인을 진행해주세요";
			map.put("result", 1);
		} else {
			memberId = memberIds[0];
			msg = "이메일로 아이디가 전송되었으니 확인 후 로그인을 진행해주세요";
			map.put("result", 1);
		}
		map.put("msg", msg);
		System.out.println("if 종료");
		System.out.println("memberId : " + memberId);
		System.out.println("memberId.null : " + (memberId == null));
		
//		String title = "[테이블허브] 이메일 인증을 통한 아이디 전송";
//		String body = "["+email+"] 주소를 사용중인 사용자의 아이디 정보입니다.\n 아이디 : [" + memberId + "]";
//		mail.sendMail(email, title, body);
		
		return map;
	}
	
	
	

}
