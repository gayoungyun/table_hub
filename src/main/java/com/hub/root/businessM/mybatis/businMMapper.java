package com.hub.root.businessM.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hub.root.businessM.DTO.businMDTO;
import com.hub.root.businessM.DTO.storeReviewDTO;

public interface businMMapper {
	public businMDTO businMChk(@Param("store_id")String store_id);
	public int register(businMDTO dto);
	//public int storeImage01(@Param("file01Path") String file01Path, @Param("store_id")String store_id);
	//public int storeImage09(@Param("filePath")String filePath, @Param("store_id")String store_id);
	public int storeImage01( Map<String, Object> param );
	public int menuRegister( Map<String, Object> menuparam );
	public businMDTO infochk(String store_id);
	public int getTotalReview(String storeId);
	public List<storeReviewDTO> getReview(@Param("storeId") String storeId ,
										  @Param("startNum") int startNum ,
										  @Param("endNum") int endNum);
	public Map<String, Object> getReviewDetail(@Param("memId") String memId,
												@Param("reviewNum") int reviewNum);
	public int deleteReview(@Param("reviews") int[] reviews);
}
