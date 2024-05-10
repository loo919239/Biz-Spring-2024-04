package com.callor.hello.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.hello.models.ImagesVO;
import com.callor.hello.service.FileUploadService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FileUploadServiceImpl implements FileUploadService {

	private final String folder;

	private final ServletContext context;

	public FileUploadServiceImpl(ServletContext context) {
		super();
		this.context = context;

		// tomcat 폴더가 아닌 Server 의 로컬 스토리지의 임의의 폴더
		folder = "/app/upload";
	}

	@Override
	public String fileUpload(MultipartFile file) throws Exception {

		String originalFileName = file.getOriginalFilename();
		if (originalFileName.isEmpty()) {
			return null;
		}
		
		File path = new File(folder);

		if (!path.exists()) {
			path.mkdirs();
		}

		String uuid = UUID.randomUUID().toString();
		String upLoadFileName = String.format("%s-%s", uuid, originalFileName);

		File upLoadFile = new File(folder, upLoadFileName);


		file.transferTo(upLoadFile);

		// 실제 저장된 파일의 이름을 return
		log.debug("외안돼 {}",upLoadFileName);
		return upLoadFileName;
	}

	@Override
	public List<ImagesVO> filesUpload(MultipartHttpServletRequest files) throws Exception {

		List<MultipartFile> result = files.getFiles("image_files");
		List<ImagesVO> resultImages = new ArrayList<>();
		for (MultipartFile f : result) {
			String resName = this.fileUpload(f);
			resultImages.add(ImagesVO.builder().img_id(UUID.randomUUID().toString()).img_org_img(f.getOriginalFilename()).img_up_img(resName).build());
		}
		return resultImages;
	}

}