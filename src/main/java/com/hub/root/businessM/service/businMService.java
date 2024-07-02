package com.hub.root.businessM.service;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.hub.root.businessM.DTO.businMDTO;
import com.hub.root.businessM.mybatis.businMMapper;

@Service
public class businMService {
	private final businMMapper mapper;
	
	@Autowired
    public businMService(businMMapper mapper) {
        this.mapper = mapper;
    }
	
	public String businMChk(String store_id) {
		businMDTO result = null;
		try {
			result = mapper.businMChk(store_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("보선-회원체크 mapper에서 나온 store_name : " + result.getStore_name());
		return result.getStore_name();
	}
	
	
	public String register01(HttpServletRequest request, Model model) {
		String result = null;
	    
		HttpSession session = request.getSession();
	    String store_id = (String) session.getAttribute("storeId");
		String storeName = businMChk(store_id);
		if(storeName == null) {
			request.setAttribute("msg", "문제 발생\n다시 시도해주세요");
	        request.setAttribute("url", "storeInfo");
	    
	        result = "businessM/businMalert";
		}
	    
		model.addAttribute("storeName : ", storeName);
		model.addAttribute("storeId : ", store_id);
		
		result = "businessM/register01";
		return result;	
	}
	
	public String register02(HttpServletRequest request, String store_name) {
		String result = null;

		HttpSession session = request.getSession();
		String store_id = (String) session.getAttribute("storeId");
		String storeName = businMChk(store_id);

		if(!storeName.equals(store_name)) {
			request.setAttribute("msg", "가게이름이 다릅니다. 다시 시도해주세요");
	        request.setAttribute("url", "register01");
	    
	        result = "businessM/businMalert";
		}
			result = "businessM/register02";
			return result;
	}
	
	public String register03(HttpServletRequest request, String store_zip, 
								String store_add, String store_add_info) {
		String result = null;
		HttpSession session = request.getSession();
		session.setAttribute("store_zip", store_zip);
		session.setAttribute("store_add", store_add);
		session.setAttribute("store_add_info", store_add_info);

        result = "businessM/register03";
        return result;
	}
	
	public String register04(HttpServletRequest request, String store_introduce, 
								String[] store_categoryS, String[] store_amenitiesS, String store_note,
								int store_max_person, String store_booking_rule) {
		String result = null;
		HttpSession session = request.getSession();
		session.setAttribute("store_introduce", store_introduce);
		String store_category = String.join("/", store_categoryS);
		session.setAttribute("store_category", store_category);
		//List<String> amenityList = Arrays.asList(store_amenities.split(","));
		String store_amenities = String.join("/", store_amenitiesS);
		session.setAttribute("store_amenities", store_amenities);
		session.setAttribute("store_note", store_note);
		session.setAttribute("store_max_person", store_max_person);
		session.setAttribute("store_booking_rule", store_booking_rule);

		result = "businessM/register04";
		return result;
	}
	
	public String registerFinish(businMDTO dto, HttpServletRequest request, 
						String[] store_business_hours) {
		String result = null;
		HttpSession session = request.getSession(false); // 세션이 없으면 null 반환
	    
	    if (session != null) {
		Enumeration<String> attributeNames = session.getAttributeNames();
		
			//attributeNames 세션의 모든 이름(키)을 가져옴, attributeValue 세션의 모든 값을 가져옴
	        while (attributeNames.hasMoreElements()) {
	            String attributeName = attributeNames.nextElement();
	            Object attributeValue = session.getAttribute(attributeName);
	            System.out.println("보선-가게등록용 세션 " + attributeName + "의 값: " + attributeValue);
	        }
	    }
	    
	    dto.setStore_id((String) session.getAttribute("storeId"));
	    dto.setStore_zip((String) session.getAttribute("store_zip"));
	    dto.setStore_add((String) session.getAttribute("store_add"));
	    dto.setStore_add_info((String) session.getAttribute("store_add_info"));
	    dto.setStore_introduce((String) session.getAttribute("store_introduce"));
	    dto.setStore_category((String) session.getAttribute("store_category"));
	    dto.setStore_amenities((String)session.getAttribute("store_amenities"));
	    dto.setStore_note((String) session.getAttribute("store_note"));
	    dto.setStore_max_person((Integer) session.getAttribute("store_max_person"));
	    dto.setStore_booking_rule((String) session.getAttribute("store_booking_rule"));
	    String store_business_hoursS = String.join("/", store_business_hours);
	    dto.setStore_business_hours(store_business_hoursS);
            
		int row = register(dto);
		System.out.println("보선-서비스에서 나온 result : " + row);
		if(row == 0) {
			request.setAttribute("msg", "문제 발생\n다시 시도해주세요");
	        request.setAttribute("url", "register01");
	        
	        result = "businessM/businMalert";
		}else {
			System.out.println("보선-가게등록 업뎃 성공");
		}
		// 세션 전체 삭제 (invalidate)
		// session.invalidate();
		
		// 세션에서 데이터 삭제
		session.removeAttribute("store_zip");
		session.removeAttribute("store_add");
		session.removeAttribute("store_add_info");
		session.removeAttribute("store_introduce");
		session.removeAttribute("store_category");
		session.removeAttribute("store_amenities");
		session.removeAttribute("store_note");
		session.removeAttribute("store_max_person");
		session.removeAttribute("store_booking_rule");
		
		Enumeration<String> attributeNames1 = session.getAttributeNames();
		while (attributeNames1.hasMoreElements()) {
			String attributeName = attributeNames1.nextElement();
			Object attributeValue = session.getAttribute(attributeName);
			System.out.println("보선-가게등록 완료 후 세션 " + attributeName + "의 값: " + attributeValue);
		}
		
		result = "businessM/registerFinish";
		return result;
	}
	
	
	public int register(businMDTO dto) {
		int result = 0;
		try {
			result = mapper.register(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("보선-가게등록 mapper에서 나온 result : " + result);
		return result;
	}
}


