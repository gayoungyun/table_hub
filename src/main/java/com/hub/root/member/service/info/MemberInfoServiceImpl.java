package com.hub.root.member.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hub.root.member.mybatis.MemberInfoMapper;

@Service
public class MemberInfoServiceImpl implements MemberInfoService{
	@Autowired MemberInfoMapper mapper;
	
	BCryptPasswordEncoder en;
	public MemberInfoServiceImpl () {
		en = new BCryptPasswordEncoder();
	}
	
	@Override
	public int memberImgModify(MultipartHttpServletRequest file, String id, String imgName) {
		MultipartFile mul = file.getFile("file");
		int result = 0;
		String fileName = saveFile(mul, id);
		deleteFile(id, imgName);
		System.out.println("mul : " + mul);
		System.out.println("id : " + id);
		System.out.println("fileName : "+ fileName);
		if (fileName != null) {
			result = mapper.memberImgModify(fileName, id);
		}
		return result;
	}
	
	
	public String saveFile( MultipartFile mul, String id) {
		String fileName = id + "_" + mul.getOriginalFilename(); 
		File saveFile = new File(IMAGE_REPO + "/" + fileName);
		System.out.println("filename : "+ fileName);
		try {
			System.out.println("try실행");
			mul.transferTo(saveFile);
			return mul.getOriginalFilename();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void deleteFile(String id, String imgName) {
		File file = new File(IMAGE_REPO + "/" + (id + "_" + imgName));
		System.out.println(IMAGE_REPO + "/" + (id + "_" + imgName));
			if (file.exists() ) {
				System.out.println("파일 있음");
				file.delete();
			} else {
				System.out.println("파일 없음");
			}
	}


	@Override
	public String memberImgDelete(String imgName, String id) {
		
		int result = mapper.memberImgDelete(id);
		String msg;
		if (result == 1) {
			deleteFile(id, imgName);
			msg = "기본이미지로 변경이 완료되었습니다.";
		} else {
			msg = "기본이미지로 되돌리던 중 문제가 발생했습니다. 새로고침 후 다시 시도해주세요";
		}
		return msg;
	}


	@Override
	public String memberNickModify(String nick, String id) {
		System.out.println("memberNickModify 서비스 실행");
		int result = mapper.memberNickModify(nick, id);
		System.out.println("memberNickModify 매퍼 실행");
		String msg;
		if (result == 1) {
			msg = "변경이 완료되었습니다.";
		} else {
			msg = "문제가 발생하였습니다. 새로고침 후 다시 시도해주세요";
		}
		return msg;
	}


	@Override
	public String memberStatusModify(String status, String id) {
		System.out.println("memberStatusModify service 실행");
		int result = mapper.memberStatusModify( status, id );
		String msg;
		if (result == 1) {
			msg = "상태 메세지 변경이 완료되었습니다.";
		} else {
			msg = "변경에 문제가 발생하였습니다.";
		}
		return msg;
	}


	@Override
	public String memberPhoneModify(String phone, String id) {
		int result = mapper.memberPhoneModify(phone, id);
		String msg;
		if (result == 1) {
			msg = "변경이 완료되었습니다.";
		} else {
			msg = "문제가 발생하였습니다. 새로고침 후 다시 시도해주세요";
		}
		return msg;
	}


	@Override
	public Map<String, Object> memberEmailModify(String email, String id) {
		Map<String, Object> map = new HashMap<>();
		int result = mapper.memberEmailModify(email, id);
		String msg;
		if (result == 1) {
			msg = "변경이 완료되었습니다.";
		} else {
			msg = "문제가 발생하였습니다. 새로고침 후 다시 시도해주세요";
		}
		map.put("msg", msg);
		map.put("result", result);
		return map;
	}


	@Override
	public Map<String, Object> memberPasswordModify(String currentPwd, String changePwd, String id) {
		String pwd = mapper.memberPasswordChk(id);
		Map<String, Object> map = new HashMap<String, Object>();
		int result;
		String msg;
		if (en.matches(currentPwd, pwd)) {
			String p = en.encode(changePwd);
			result = mapper.memberPasswordModify(p, id);
			if (result == 1) {
				msg = "비밀번호가 변경되었습니다. 로그인페이지로 이동합니다.";
			} else {
				msg = "문제가 발생하였습니다. 새로고침 후 다시 시도해주세요";
			}
		} else {
			result = -1;
			msg = "기존 비밀번호가 일치하지 않습니다. 확인 후 다시 시도해주세요";
		}
		map.put("result", result);
		map.put("msg", msg);
		return map;
	}
	
	
	
	
	
	
	
	
	
	

}
