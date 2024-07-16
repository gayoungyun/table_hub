package com.hub.root.businessM.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	    
		HttpSession session = request.getSession();
	    String store_id = (String) session.getAttribute("storeId");
		String storeName = businMChk(store_id);
		if(storeName == null) {
			request.setAttribute("msg", "회원정보가 잘못 되었습니다.\n고객센터로 문의 바랍니다");
	        request.setAttribute("url", "storeInfo");
	    
	        return "businessM/businMalert";
		}
	    
		model.addAttribute("storeName", storeName);
		model.addAttribute("storeId", store_id);
		
		return "businessM/store/register01";
	}
	
	public String register02(HttpServletRequest request, String store_name) {

		HttpSession session = request.getSession();
		String store_id = (String) session.getAttribute("storeId");
		String storeName = businMChk(store_id);

		if(!storeName.equals(store_name)) {
			request.setAttribute("msg", "가게이름이 다릅니다. 다시 시도해주세요");
	        request.setAttribute("url", "register01");
	    
	        return "businessM/businMalert";
		}
			return "businessM/store/register02";
	}
	
	public String register03(HttpServletRequest request, String store_zip, 
								String store_add, String store_add_info) {
		HttpSession session = request.getSession();
		session.setAttribute("store_zip", store_zip);
		session.setAttribute("store_add", store_add);
		session.setAttribute("store_add_info", store_add_info);

		return "businessM/store/register03";
	}
	
	public String register04(HttpServletRequest request, String store_introduce, 
								String[] store_categoryS, String[] store_amenitiesS, String store_note,
								int store_max_person, String store_booking_rule) {
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

		return "businessM/store/register04";
	}
	
	public String registerFinish(businMDTO dto, HttpServletRequest request, 
						String[] store_business_hours) {
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
	        
	        return "businessM/businMalert";
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
		
		return "businessM/store/registerFinish";
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
	
	//이미지 저장경로 \\\\192.168.42.40\\공유폴더\\tableHub\\businessM
	// 업로드된 파일을 저장할 경로
	private static String UPLOAD_FOLDER = "\\\\192.168.42.40\\공유폴더\\tableHub\\businessM";
	public String storeImage(HttpServletRequest request,
				MultipartFile file01, MultipartFile file02, MultipartFile file03, 
				MultipartFile file04, MultipartFile file05) {
		   try {
	            // 업로드 폴더가 없을 경우 생성
	            if (!Files.exists(Paths.get(UPLOAD_FOLDER))) {
	                Files.createDirectories(Paths.get(UPLOAD_FOLDER));
	            }

            // 각 파일을 업로드 폴더에 저장
            String file01Path = saveFileAndGetPath(file01);
            String file02Path = saveFileAndGetPath(file02);
            String file03Path = saveFileAndGetPath(file03);
            String file04Path = saveFileAndGetPath(file04);
            String file05Path = saveFileAndGetPath(file05);
            
            System.out.println("보선-값이 들어온 사진은? : \n 01 : "+file01Path+"\n 02 : "+file02Path+"\n 03 : "+file03Path
            					+"\n 04 : "+file04Path+"\n 05 : "+file05Path);
            
            HttpSession session = request.getSession();
            String store_id = (String) session.getAttribute("storeId");
            System.out.println("보선-세션 아이디 store_id 확인 : "+store_id);
            
            /*
            String[] filePaths = {file02Path, file03Path, file04Path, file05Path};
            List<String> FilePaths = new ArrayList<>();
            
            // 배열 순회하면서 null이 아닌 경우에만 리스트에 추가
            for (String path  : filePaths) {
                if (path  != null) {
                	FilePaths.add(path );
                }
            }
            if (FilePaths.size() > 0 && FilePaths.get(0) != null && !FilePaths.get(0).isEmpty())
                System.out.println("보선-경로 배열 확인 2번 : " + FilePaths.get(0)); // file02Path
            if (FilePaths.size() > 1 && FilePaths.get(1) != null && !FilePaths.get(1).isEmpty())
                System.out.println("보선-경로 배열 확인 3번 : " + FilePaths.get(1)); // file03Path
            if (FilePaths.size() > 2 && FilePaths.get(2) != null && !FilePaths.get(2).isEmpty())
                System.out.println("보선-경로 배열 확인 4번 : " + FilePaths.get(2)); // file04Path
            if (FilePaths.size() > 3 && FilePaths.get(3) != null && !FilePaths.get(3).isEmpty())
                System.out.println("보선-경로 배열 확인 5번 : " + FilePaths.get(3)); // file05Path
             */
            
            int result01 = mapper.storeImage01(file01Path, store_id);
            
            int result02=0, result=0;
            if(file02Path != null) {
            	String filePath = file02Path;
            	result02 = mapper.storeImage09(filePath, store_id);
            }
            if(file03Path != null) {
            	String filePath = file03Path;
            	result = mapper.storeImage09(filePath, store_id);
            	result02 += result;
            }
            if(file04Path != null) {
            	String filePath = file04Path;
            	result = mapper.storeImage09(filePath, store_id);
            	result02 += result;
            }
            if(file05Path != null) {
            	String filePath = file05Path;
            	result = mapper.storeImage09(filePath, store_id);
            	result02 += result;
            }
            System.out.println("보선-메인 사진이 등록되었나? : "+result01);
            System.out.println("보선-메인 사진 외 추가 사진 갯수 : "+result02);
            
            
	         if(result01 > 0)
	            	return "businessM/photo/photoRFinish";
	         else {
	            	request.setAttribute("msg", "오류발생\n 사진이 등록되지 않았습니다.\n 다시 시도해주세요");
	    	        request.setAttribute("url", "/businessM/menuInfo");
	    	        return "businessM/businMalert";
	         }
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "파일 업로드 실패: " + e.getMessage();
	        }
		   
	    }

	// 파일을 저장하는 메서드
	private String saveFileAndGetPath(MultipartFile file) throws IOException {
		if (!file.isEmpty()) {
	        byte[] bytes = file.getBytes();
	        /* 파일을 바이트 배열로 변환하는 이유는 파일을 읽거나 다루기 쉽게 하기 위함입니다. 
	         * 예를 들어 파일을 디스크에 저장할 때나 네트워크를 통해 전송할 때는 바이트 배열 형태로 변환하여 다루는 것이 일반적입니다. */
	        String uniqueFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
	        Path path = Paths.get(UPLOAD_FOLDER + "/" + uniqueFileName);
	        Files.write(path, bytes);
	        return path.toString();
	    }
	    return null;
	}  
}
	




