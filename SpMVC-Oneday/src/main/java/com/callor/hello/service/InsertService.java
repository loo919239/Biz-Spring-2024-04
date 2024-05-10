package com.callor.hello.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.hello.models.InsertVO;

public interface InsertService {
	public List<InsertVO> selectAll();

	public InsertVO createGallery(InsertVO insertVO, MultipartFile image_file) throws Exception;

	public List<InsertVO> createGallery(InsertVO insertVO, MultipartHttpServletRequest image_files) throws Exception;

}
