package com.hub.root.main.service;

import org.springframework.web.multipart.MultipartFile;

public interface MainFileService {
	public static final String IMAGE_REPO = "c:/spring/img";
	public String saveFile(MultipartFile mul);
	public void deleteImage(String originName);
			
}
