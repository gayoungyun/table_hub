package com.hub.root.store.mybatis;

import java.util.List;

import com.hub.root.store.DTO.storeInfoDTO;
import com.hub.root.store.DTO.storeMenuDTO;
import com.hub.root.store.DTO.storeReviewDTO;
import com.hub.root.store.DTO.storeReviewImgDTO;

public interface storeMapper {
	public storeInfoDTO storeInfo(String store_id);
	public String storeImgMain(String store_id);
	public List<String> storeImg(String store_id);
	public Integer storeBookmark(String store_id);
	public storeMenuDTO storeMenu(String store_id);
	public storeReviewDTO storeReview(String store_id);
	public storeReviewImgDTO storeReviewImg(String store_id);

}
