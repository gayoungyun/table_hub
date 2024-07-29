package com.hub.root.store.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.root.store.DTO.reviewNumDTO;
import com.hub.root.store.DTO.storeBookmarkDTO;
import com.hub.root.store.DTO.storeInfoDTO;
import com.hub.root.store.DTO.storeMenuDTO;
import com.hub.root.store.DTO.storeReviewDTO;
import com.hub.root.store.DTO.storeReviewImgDTO;
import com.hub.root.store.mybatis.storeMapper;

@Service
public class storeService {
	private final storeMapper mapper;
	private storeInfoDTO infoDTO;
	private storeMenuDTO menuDTO;
	private storeReviewDTO reviewDTO;
	private storeReviewImgDTO reviewImgDTO;
	private storeBookmarkDTO bookmarkDTO;
	private reviewNumDTO numDTO;

	@Autowired
	public storeService(storeMapper mapper) {
		this.mapper = mapper;
	}

	public Map<String, Object> store(HttpServletRequest request, String store_id) {

		List<String> storeImg = new ArrayList<>();
		List<String> reviewImg = new ArrayList<>();
		infoDTO = mapper.storeInfo(store_id);
		String mainImg = mapper.storeImgMain(store_id);
		storeImg = mapper.storeImg(store_id);
		List<storeBookmarkDTO> Bmark  = mapper.storeBookmark(store_id);
		List<storeReviewDTO> review = mapper.storeReview(store_id);
		reviewImg = mapper.storeReviewImg(store_id);

		int totalBookmark = Bmark.size();
		int totalreview = review.size();
		int scoreAvr= averageScore(review);

		infoDTO.setStore_add(statefix(infoDTO.getStore_add()));
		infoDTO.setStore_category(infoDTO.getStore_category().replace("/", ", "));
		mainImg = mainImgname(mainImg);
		storeImg = Imgsname(storeImg);

		System.out.println("review 사이즈01' :"+reviewImg);

		reviewImg = reviewImage(reviewImg);

		System.out.println("보선--infoDTO확인--"
						+"\n store_category : "+infoDTO.getStore_category()
						+"\n store_name : "+infoDTO.getStore_name()
						+"\n store_add : "+infoDTO.getStore_add()
						+"\n store_max_person : "+infoDTO.getStore_max_person()
						+"\n --메인 이미지--"
						+"\n mainImg :"+mainImg
						+"\n --북마크--"
						+"\n totalBookmark :"+totalBookmark
						);
		 for (int i = 0; i < storeImg.size(); i++) {
	            Object element = storeImg.get(i);
	            System.out.println("일반사진" + (i + 1) + ": " + element);
	        }
		 for (int i = 0; i < reviewImg.size(); i++) {
			 Object element = reviewImg.get(i);
			 System.out.println("리뷰사진" + (i + 1) + ": " + element);
		 }


		Map<String, Object> MainInfoMap = new HashMap<>();
		MainInfoMap.put("infoDTO", infoDTO); // DTO값
		MainInfoMap.put("mainImg", mainImg); // String
		MainInfoMap.put("storeImg", storeImg); // List
		MainInfoMap.put("totalBookmark", totalBookmark); // Integer
		MainInfoMap.put("totalreview", totalreview); // Integer
		MainInfoMap.put("totalreview", totalreview); // Integer
		MainInfoMap.put("scoreAvr", scoreAvr); // Integer
		MainInfoMap.put("reviewImg", reviewImg); // List

		return MainInfoMap;
	}


	public storeInfoDTO storeInfo(String store_id) {
		storeInfoDTO dto = new storeInfoDTO();
		dto = mapper.storeInfo(store_id);
		return dto;
	}


	public Map<String, Object> jjim(HttpServletRequest request, String store_id) {
		System.out.println("찜하기 서비스");

		HttpSession session = request.getSession();
	    String user_id = (String) session.getAttribute("userId");
		String storeId = (String) session.getAttribute("storeId");



	    int result01=0, result02=0;
	    int num=0;
	    Map<String, Object> Jmap = new HashMap<>();

	    if(storeId != null) {
	    	Jmap.put("result", 0);
	    	Jmap.put("msg", "사업자 회원은 찜하기를 할 수 없습니다.");
	    	Jmap.put("url", "member/login");

	    	return Jmap;
	    }else if(user_id == null) {
			Jmap.put("result", 0);
			Jmap.put("msg", "회원 로그인이 필요한 서비스입니다");
			Jmap.put("url", "member/login");

	        return Jmap;
	    }else {
	    	result01 = mapper.jjimchk(user_id, store_id);

	    	if(result01 == 1){
	    		result02 = mapper.jjimcancle(user_id, store_id);

	    		if(result02 == 0) {
	    			Jmap.put("result", 0);
	    			Jmap.put("msg", "찜 취소 실패\n고객센터로 문의주세요");
	    			Jmap.put("url", "store/store");

	    	        return Jmap;
	    		}else {
	    			Jmap.put("result", 1);
	    			Jmap.put("msg", "찜이 취소되었습니다");

	    			return Jmap;
	    		}

	    	}else {
	    		num = mapper.jjim(user_id, store_id);

	    		if(num == 1) {
	    			Jmap.put("result", 1);
	    			Jmap.put("msg", "가게를 찜했습니다");

	    			return Jmap;
	    		}else {
	    			Jmap.put("result", 0);
	    			Jmap.put("msg", "찜 실패\n고객센터로 문의주세요");
	    			Jmap.put("url", "store/store");

	    			return Jmap;
	    		}
	    	}
	    }
	}

	public List<storeMenuDTO> storeMenu(String store_id) {
		List<storeMenuDTO> menuDTO = mapper.storeMenu(store_id);
		menuDTO = (menuImg(menuDTO));

		return menuDTO;
	}


	public List<reviewNumDTO> storeReview(String store_id){
		List<storeReviewDTO> reviewDTO = mapper.storeReview(store_id);
		List<storeReviewImgDTO> reviewImgDTO = mapper.reviewImage(store_id);
		List<reviewNumDTO> numDTO = new ArrayList<>();

		for (storeReviewDTO reviewNum : reviewDTO) {
		int revNum = reviewNum.getStore_review_num();

			for (storeReviewImgDTO imageNum : reviewImgDTO) {
				int imgNum = imageNum.getStore_review_num();

					if(revNum == imgNum) {
					    reviewNumDTO num = new reviewNumDTO();

		                num.setStore_review_num(revNum);
		                num.setStore_id(store_id);
		                num.setMember_id(reviewNum.getMember_id());
		                num.setStore_review_body(reviewNum.getStore_review_body());
		                num.setStore_review_date_create(reviewNum.getStore_review_date_create());
		                num.setStore_review_score(reviewNum.getStore_review_score());
		                num.setBooking_id(reviewNum.getBooking_id());
		                String imgPath = mainImgname(imageNum.getStore_review_img_image());
		                num.setStore_review_img_image(imgPath);

		                numDTO.add(num);
					}
			}
		}
		return numDTO;
	}




	public  Map<String, Object> photos (String store_id) {

		List<String> storeImg = new ArrayList<>();
		List<String> reviewImg = new ArrayList<>();
		storeImg = mapper.storeImg(store_id);
		reviewImg = mapper.storeReviewImg(store_id);

		storeImg = Imgsname(storeImg);
		reviewImg = reviewImage(reviewImg);

		Map<String, Object> photoMap = new HashMap<>();
		photoMap.put("storeImg", storeImg);
		photoMap.put("reviewImg", reviewImg);

		return photoMap;

	}

	public String storeMap(String store_id) {

		infoDTO = mapper.storeInfo(store_id);
		String storeAdd = infoDTO.getStore_add();

		return storeAdd;

	}






	//-------------------------------------------


	public int averageScore(List<storeReviewDTO> review) {
		if(review.size() == 0) {
			return 0;
		}else {
			int total = 0;

			for(storeReviewDTO score : review) {
				total += score.getStore_review_score();
			}
			int avr = total / review.size();
			return avr;
		}
	}


	public String statefix(String store_add) {

	    String[] parts = store_add.split(" ");
	    String state = parts[1];// 서울 가나다 > 가나다 할당 (인덱스 1번에 해당하는 문장)
	    String stateFix = state.substring(0, 2); // 가나다 > 가나 만 할당 (인덱스 0번부터 1번까지)
	    /* 안전한 변환을 위해 체크를 해서 할당하는 방식도 있으나 주소가 일관되게 들어오므로 체크없이 할당함
	    String state = parts.length > 1 ? parts[1] : "";
	    String statePrefix = state.length() >= 2 ? state.substring(0, 2) : "";
	    */

	    return stateFix;
	}

	   public static String mainImgname(String mainImg) {
	    	String[] parts = mainImg.split("\\\\");
	        String splitImgPath = parts[parts.length - 1];
	        // 분할한 파일경로의 마지막이 파일 이름이므로 배열의 마지막요소 할당

	        return splitImgPath;
	    }


	    public static List<String> Imgsname(List<String> storeImg) {
	    	 List<String> fileNames = new ArrayList<>();

	    	    for (String imgPath : storeImg) {
	    	        // 파일 경로를 역슬래시(\\) 또는 슬래시(/)로 분할하여 배열로 변환
	    	        String[] parts = imgPath.split("\\\\");
	    	        String fileName = parts[parts.length - 1];

	    	        fileNames.add(fileName);
	    	    }

	    	    return fileNames;
	    	}

	    public static List<String> reviewImage (List<String> reviewImg) {
	    	List<String> fileNames = new ArrayList<>();

	    	for (String imgPath : reviewImg) {
	    		// 파일 경로를 역슬래시(\\) 또는 슬래시(/)로 분할하여 배열로 변환
	    		String[] parts = imgPath.split("\\\\");
	    		String fileName = parts[parts.length - 1];

	    		fileNames.add(fileName);
	    	}

	    	return fileNames;
	    }


	public static List<storeMenuDTO> menuImg(List<storeMenuDTO> menuDTO) {

    	for (storeMenuDTO imgPath : menuDTO) {
    		// 파일 경로를 역슬래시(\\) 또는 슬래시(/)로 분할하여 배열로 변환
    		String[] parts = imgPath.getStore_menu_img().split("\\\\");
    		String fileName = parts[parts.length - 1];

    		imgPath.setStore_menu_img(fileName);
    	}

    	return menuDTO;
    }

	/*

	 */
}
