package com.hub.root.member.service.login;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;

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
	
	public BCryptPasswordEncoder en;
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
			map.put("msg", msg);
			return map;
		} else if (memberIds.length > 1) { // 간편로그인이 있을 경우 이메일 중복가능성이 있음
			System.out.println("elseif 실행");
			
			//불러온 데이터중 _으로 구분되는 첫번째 자리의 값이 N이 아닌 값을 대입한다.
			for (int i = 0; i < memberIds.length; i++) {
				String[] check = memberIds[i].split("_");
				if (check[0] != "N") {
					memberId = memberIds[i];
					break;
				}
			}
			
		} else {
			memberId = memberIds[0];
		}
		msg = "이메일로 아이디가 전송되었으니 확인 후 로그인을 진행해주세요";
		map.put("result", 1);
		map.put("msg", msg);
		
		//전송될 이메일에 포함될 제목, 내용을 설정하는 부분
		String title = "[테이블허브] 이메일 인증을 통한 아이디 전송";
		StringBuffer body = new StringBuffer(); 
		body.append("["+email+"] 주소를 사용중인 사용자의 아이디 정보입니다.\n 아이디 : [" + memberId + "]<br>");
		body.append("로그인은 하러 가시려면 아래 링크를 클릭해주세요 <br> <a href='http://localhost:8080/root/member/login'>로그인 하러 가기</a>");
		
		mail.sendMail(email, title, body.toString());
		
		return map;
	}

	@Override
	public Map<String, Object> idEmailChk(String id, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = mapper.idEmailChk(id, email);
		System.out.println("result : " + result);
		String msg = "";
		String url = "";
		
		map.put("result", result);
		
		// 아이디와 이메일주소가 일치한다면 비밀번호 셋팅 페이지로 이동
		// 일치하지 않는다면 안내 메세지 출력
		if (result == 1) {
			String encodeId = en.encode(id);
			msg = "이메일 주소로 패스워드 설정 링크가 전달되었습니다. <br>5초 후 버튼이 다시 활성화 됩니다.";
			map.put("msg", msg);
			
			String title = "[테이블허브] 패스워드 초기화 링크";
			String body = "["+id+"] 님의 패스워드 초기화 링크입니다.";
			body += "아래 링크를 클릭하여 패스워드를 재설정해주세요";
			body += "<a href=http:localhost:8080/root/member/login/searchPwd/modifyPwd?id="+encodeId+">패스워드 초기화</a>";
			
			map.put("encodeId", encodeId);
			mail.sendMail(email, title, body.toString());
		} else {
			msg = "아이디와 이메일주소를 확인해주세요";
			map.put("msg", msg);
		}
		return map;
	}
	
	public int modifyPwdIdChk(String id, Cookie[] cookies) {
		String encodeId = "";
		
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("id")) {
					encodeId = c.getValue();
				}
			}
		}
		
		if (id.equals(encodeId)) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public Map<String, Object> modifyPwd(String pwd, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		pwd = en.encode(pwd);
		int result = mapper.modifyPwd(pwd, id);
		String msg = "";
		String url = "";
		if (result == 1) {
			msg = "변경이 완료되었습니다. 로그인 페이지로 이동합니다.";
			url = "/root/member/login";
		} else {
			msg = "변경에 문제가 발생하였습니다. 비밀번호 찾기를 다시 진행해주세요";
			url = "/root/member/searchPwd";
		}
		map.put("result", result);
		map.put("msg", msg);
		map.put("url", url);
		return map;
	}
	
	
	
	
	
	

}
