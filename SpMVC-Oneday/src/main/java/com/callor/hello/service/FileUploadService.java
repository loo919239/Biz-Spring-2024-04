package com.callor.hello.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.hello.models.ImagesVO;

public interface FileUploadService {
	public String fileUpload(MultipartFile file) throws Exception;
	
	// 여러개의 파일을 업로드 실행하고 변형된 파일 이름 리스트를 return
	public List<ImagesVO> filesUpload(MultipartHttpServletRequest File) throws Exception ;
	
}
