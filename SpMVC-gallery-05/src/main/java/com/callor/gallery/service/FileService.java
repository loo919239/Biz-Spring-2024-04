package com.callor.gallery.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.gallery.modles.ImagesVO;

public interface FileService {
	
	public String filesUp(MultipartFile file);
	public List<ImagesVO> filesUp(MultipartHttpServletRequest files);
	public void fileDelete(String i_up_image);

}
