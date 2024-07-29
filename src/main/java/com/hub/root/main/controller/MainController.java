package com.hub.root.main.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hub.root.main.dto.MainImgDTO;
import com.hub.root.main.dto.MainMapDTO;
import com.hub.root.main.dto.MainReviewDTO;
import com.hub.root.main.service.MainFileService;
import com.hub.root.main.service.MainService;

@Controller
@RequestMapping("main")//main이라는 경로에 대한 요청
public class MainController {
	@Autowired MainService ms;
	// 헤더 페이지 요청 처리===================================
	@GetMapping("header")
	public String header() {
		return "main/header";
	}
	// mainPage1 요청 처리===================================
	@GetMapping("mainPage1")
	public String main(@RequestParam(name="category", required=false) String category,
						HttpSession session,Model model) {

		String user = (String) session.getAttribute("userId");
		String store = (String) session.getAttribute("storeId");

		Map<String, Object> params = new HashMap<>();
		String cat = (category != null) ? category : "null";
		params.put("category", category);

		System.out.println("parameter:" +params);

		if(user != null) {
			model.addAttribute("user", user);
		}	else if (store != null) {
	        model.addAttribute("store", store);
	    }

		List<String> categories = ms.getAllCategories();//?
		//List<MainDTO> dtoList = ms.mainPage1(model);//?

		List<MainMapDTO> storeList = ms.getStoreInfo(params);//?


//		if (storeList.isEmpty()) {
//	        System.out.println("No store information found for the given parameters.");
//	        model.addAttribute("storeList", null);
//	    } else {
//	        List<String> storeIds = new ArrayList<>();
//	        for (MainMapDTO storeInfo : storeList) {
//	            storeIds.add(storeInfo.getStore_id());
//	        }

		List<String> storeIds = new ArrayList<>();
	    for (MainMapDTO storeInfo : storeList) {
	        storeIds.add(storeInfo.getStore_id());
	    }

		// 위에서 처리시 모든 store_id에 대해 이미지 추가 방식이므로, store_id별로 분리
	    List<List<MainImgDTO>> storeImgToMain = ms.getStoreImgToMain(storeIds);


//	    for (List<MainImgDTO> imgList : storeImgToMain) {
//	        for (MainImgDTO img : imgList) {
//	            System.out.println("Store ID: " + img.getStore_id() + " Image Path: " + img.getStore_img_root());
//	        }
//	    }


//	    // store_img 테이블에서 이미지를 가져오는 부분 추가
//	    List<MainImgDTO> storeImgList = new ArrayList<>();
//	    for(MainMapDTO storeInfo : storeList) {
//	        List<MainImgDTO> storeImage = ms.getStoreImage(storeInfo.getStore_id());
//	        if (!storeImage.isEmpty()) {
//	            storeImgList.add(storeImage.get(0));
//	        } else {
//	            storeImgList.add(null); // 이미지가 없는 경우
//	        }
//	    }

	    // 로그 추가
	    System.out.println("Categories: " + categories);
	    System.out.println("Store List: " + storeList);
	    System.out.println("Store Images: " + storeImgToMain);

		model.addAttribute("categories", categories);
		//model.addAttribute("dtoList", dtoList);
		model.addAttribute("storeImgToMain", storeImgToMain);
		model.addAttribute("storeList", storeList);
		//model.addAttribute("storeImgList", storeImgList);
		return "main/mainPage1";

	}


	// mainPage1에 카테고리별 이미지 가져오기 =====================
//	@GetMapping("menuByCategory")
//	public String getMenuByCategory(@RequestParam String category, HttpSession session, Model model) {
//		String user = (String) session.getAttribute("userId");
//		String store = (String) session.getAttribute("storeId");
//
//		//List<MainImgDTO> dtoList = ms.getMenuByCategory(category);
//		List<String> categories = ms.getAllCategories();
//
//		List<MainImgDTO> dtoList = ms.getStoreImg(category);
//
//		List<String> storeIds = new ArrayList<>();
//	    for (MainImgDTO storeInfo : dtoList) {
//	        storeIds.add(storeInfo.getStore_id());
//	    }
//
//		//List<List<MainImgDTO>> storeSmallImgLists = ms.getStoreSmallImages(storeIds);
//
//		//model.addAttribute("storeList", storeList);
//		model.addAttribute("dtoList", dtoList);
//		model.addAttribute("categories", categories);
//		return "main/mainPage1";
//	}

//	// mainPage1에 현재 위치 기반 가게 정보 가져오기 ===============
//	@PostMapping("/getStoresByLocation")
//	@ResponseBody
//	public ResponseEntity<?> getStoresByLocation(@RequestBody Map<String, Object> location) {
//	    double latitude = Double.parseDouble(location.get("latitude").toString());
//	    double longitude = Double.parseDouble(location.get("longitude").toString());
//	    //String address = location.get("address").toString();
//	    try {
//	        List<MainDTO> stores = ms.getStoreByLocation(latitude, longitude);
//	        return ResponseEntity.ok(stores);
//	    } catch (Exception e) {
//	    	e.printStackTrace();
//	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error retrieving stores: " + e.getMessage());
//	    }
//	}
	/*
	@Value("${kakao.api.key}")
	private String kakaoApikey;

	@PostMapping("/getAddr")
	@ResponseBody
	public ResponseEntity<?> getAddr(@RequestBody Map<String, Object> location) {
        double latitude = Double.parseDouble(location.get("latitude").toString());
        double longitude = Double.parseDouble(location.get("longitude").toString());
        String url = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x=" + longitude + "&y=" + latitude + "&input_coord=WGS84";

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK " + kakaoApiKey);
        HttpEntity<String> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
            return ResponseEntity.ok(response.getBody());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error retrieving address: " + e.getMessage());
        }
    }
}
	*/
	// mainPage2 요청 처리===================================
	@RequestMapping("mainPage2")
	public String mainPage2(@RequestParam(required=false) String keyword,
	                        @RequestParam(required=false) String searchType,
	                        @RequestParam(required=false) String category,
	                        @RequestParam(required=false) String sortType,
	                        HttpSession session, Model model) {
		String user = (String) session.getAttribute("userId");
		String store = (String) session.getAttribute("storeId");

		if(user != null) {
			model.addAttribute("user", user);
		}	else if (store != null) {
	        model.addAttribute("store", store);
	    }

	    Map<String, Object> params = new HashMap<>();
	    String key = (keyword != null) ? keyword : "null";
	    String search = (searchType != null) ? searchType : "null";
	    String cat = (category != null) ? category : "null";

	    params.put("keyword", key);
	    params.put("searchType", search);
	    params.put("category", cat);
	    params.put("sortType", sortType);

	    //List<MainMapDTO> storeList = ms.getStoreInfo(params);

//	    if (storeList == null) {
//	        storeList = new ArrayList<>();
//	    }

	   // if (imgList == null) {
	     //   imgList = new ArrayList<>();
	   // }


	    if("review".equals(sortType)) {
	    	List<MainReviewDTO> reviewList = ms.getReviewList(params);
	    	model.addAttribute("reviewList", reviewList);
	    }else if("popularity".equals(sortType)) {
	    	List<MainReviewDTO> popularityList = ms.getPopularityList(params);
	    	model.addAttribute("popularityList", popularityList);
	    }else {
	    	List<MainMapDTO> storeList = ms.getStoreInfo(params);
	    	model.addAttribute("storeList", storeList);


		List<String> storeIds = new ArrayList<>();
	    for (MainMapDTO storeInfo : storeList) {
	        storeIds.add(storeInfo.getStore_id());
	    }

	    List<MainImgDTO> storeImgList = new ArrayList<>();
	    for(MainMapDTO storeInfo : storeList) {
	    	List<MainImgDTO> storeImage = ms.getStoreImage(storeInfo.getStore_id());
	    	//storeImgList.add(storeImage);
	    	  if (!storeImage.isEmpty()) {
	              storeImgList.add(storeImage.get(0));
	              //System.out.println("image path: "+storeImage.get(0).getStore_img_root());
	          } else {
	              storeImgList.add(null); // 이미지가 없는 경우
	          }
	    }

//	    List<MainImgDTO> storeSmallImgList = new ArrayList<>();
//	    for(MainMapDTO storeInfo : storeList) {
//	    	List<MainImgDTO> storeSmallImage = ms.getStoreSmallImage(storeInfo.getStore_id());
//	    	  if (!storeSmallImage.isEmpty()) {
//	    		  int maxImages = Math.min(4, storeSmallImage.size());
//	    		  for(int i = 0; i < maxImages; i++) {
//	    			  storeSmallImgList.add(storeSmallImage.get(i));
//	              //System.out.println("image path: "+storeSmallImage.get(i).getStore_img_root());
//	    		  }
//	          } else {
//	        	  storeSmallImage.add(null); // 이미지가 없는 경우
//	          }
//	    }

	    // 위에서 처리시 모든 store_id에 대해 이미지 추가 방식이므로, store_id별로 분리
	    List<List<MainImgDTO>> storeSmallImgLists = ms.getStoreSmallImages(storeIds);


	    //model.addAttribute("storeList", storeList);
	    model.addAttribute("storeListSize", storeList.size());
	    //model.addAttribute("imgList", imgList);
	    model.addAttribute("storeImgList", storeImgList);
	    model.addAttribute("storeSmallImgLists", storeSmallImgLists);
	    //model.addAttribute("revList", revList);
	    }
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("searchType", searchType);
	    model.addAttribute("category", category);
	    model.addAttribute("sortType", sortType);

	    return "main/mainPage2";
	}

	// 정보 입력 페이지 요청 처리(store_menu)====================
	@RequestMapping("inputInfo")
	public String inputInfo() {
		return "main/inputInfo";
	}
	// 정보 저장 요청 처리(store_menu)=========================
	@RequestMapping("infoSave")
	public void infoSave(@RequestParam("store_menu_img") MultipartFile mul,
							HttpServletResponse res,
							@RequestParam String store_id,
							@RequestParam String store_menu_name,
							@RequestParam int store_menu_price,
							@RequestParam String store_menu_detail,
							@RequestParam String store_menu_category,
							HttpSession session, Model model) throws IOException{
		String imagePath  = ms.saveMenuImage(mul);
		String store = (String) session.getAttribute("storeId");

		if(store != null) {
			model.addAttribute("store", store);
		}
		ms.infoSave(store_id,store_menu_name,store_menu_price,store_menu_detail,store_menu_category, imagePath);
		//ms.saveImagePathToStoreImg(store_id, imgPath);
	}
	// 파일 다운로드 요청 처리==================================
	@GetMapping("download")
	public void download(@RequestParam String fileName, HttpServletRequest req, HttpServletResponse res) throws Exception {
	    File file = new File(MainFileService.IMAGE_REPO + "/" + fileName);

	    if (file.exists()) {
	        String mimeType = req.getServletContext().getMimeType(file.getName());
	        if (mimeType == null) {
	            mimeType = "application/octet-stream";
	        }
	        res.setContentType(mimeType);
	        res.setContentLength((int) file.length());
	        res.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

	        try (FileInputStream in = new FileInputStream(file)) {
	            FileCopyUtils.copy(in, res.getOutputStream());
	        }
	    } else {
	        System.err.println("File not found: " + file.getAbsolutePath());
	        res.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
	    }
	}

	// 정보 입력 페이지 요청 처리(store_info)====================
	@RequestMapping("storeInfo")
	public String storeInfo() {
		return "main/storeInfo";
	}
	// 정보 저장 요청 처리(store_info)=========================
	@RequestMapping("storeSave")
	public void storeSave(	HttpServletResponse res,
							@RequestParam String store_id,
							@RequestParam String store_pwd,
							@RequestParam String store_email,
							@RequestParam String store_phone,
							@RequestParam String store_main_phone,
							@RequestParam String store_name,
							@RequestParam String store_add,
							@RequestParam String store_add_info,
							@RequestParam String store_category,
							@RequestParam String store_note,
							@RequestParam String store_introduce,
							@RequestParam String store_business_hours) throws IOException{
		ms.storeSave(store_id,store_pwd,store_email,store_phone,store_main_phone,store_name,store_add,
				store_add_info,store_category,store_note,store_introduce,store_business_hours);
	}

}