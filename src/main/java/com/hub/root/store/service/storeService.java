package com.hub.root.store.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Autowired
	public storeService(storeMapper mapper) {
		this.mapper = mapper;
	}

	public Map<String, Object> store(HttpServletRequest request, String store_id) {

		List<String> storeImg = new ArrayList<>();
		infoDTO = mapper.storeInfo(store_id);
		String mainImg = mapper.storeImgMain(store_id);
		storeImg = mapper.storeImg(store_id);
		Integer totalBookmark = mapper.storeBookmark(store_id);

		//reviewDTO = mapper.storeReview(store_id);
		//reviewImgDTO = mapper.storeReviewImg(store_id);

		if(totalBookmark == null)
			totalBookmark = 0;

		//infoDTO.setStore_add(statefix(infoDTO.getStore_add()));

		mainImg = mainImgname(mainImg);
		storeImg = Imgsname(storeImg);



		System.out.println("보선--infoDTO확인--"
						+"\n store_id : "+infoDTO.getStore_id()
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


		Map<String, Object> MainInfoMap = new HashMap<>();
		MainInfoMap.put("infoDTO", infoDTO); // DTO값
		MainInfoMap.put("mainImg", mainImg); // String
		MainInfoMap.put("storeImg", storeImg); // List
		MainInfoMap.put("totalBookmark", totalBookmark); // Integer

		return MainInfoMap;
	}

	public String statefix(String store_add) {

		String storeAdd = store_add;
	    String[] parts = storeAdd.split(" ");
	    String state = parts.length > 1 ? parts[1] : "";
	    String statePrefix = state.length() >= 2 ? state.substring(0, 2) : "";

	    return statePrefix;
	}

    public static String mainImgname(String mainImg) {
    	String[] parts = mainImg.split("\\\\");
        String splitImgPath = parts[parts.length - 1];
        // 분할한 파일경로의 마지막이 파일 이름이므로 배열의 마지막요소 할당

        System.out.println("저장된 파일명: " + splitImgPath);
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


	public storeInfoDTO storeInfo(String store_id) {
		infoDTO = mapper.storeInfo(store_id);
		return infoDTO;
	}

	/*
		menuDTO = mapper.storeMenu(store_id);
		reviewDTO = mapper.storeReview(store_id);
		reviewImgDTO = mapper.storeReviewImg(store_id);
	 */
}
