package com.callor.hello.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.hello.dao.ImagesDao;
import com.callor.hello.dao.InsertDao;
import com.callor.hello.models.ImagesVO;
import com.callor.hello.models.InsertVO;
import com.callor.hello.service.FileUploadService;
import com.callor.hello.service.InsertService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class InsertServiceImpl implements InsertService {
	private final InsertDao insertDao;
	private final FileUploadService fileUploadService;
	private final ImagesDao imagesDao;
	
	public InsertServiceImpl(InsertDao insertDao, FileUploadService fileUploadService, ImagesDao imagesDao) {
		super();
		this.insertDao = insertDao;
		this.fileUploadService = fileUploadService;
		this.imagesDao = imagesDao;
	}

	@Autowired
	public void create_table() {
		insertDao.create_table(null);
		imagesDao.create_table("");
	}

	@Override
	public List<InsertVO> selectAll() {
		return insertDao.selectAll();
	}

	/*
	 * ?
	 */
	@Override
	public InsertVO createGallery(InsertVO insertVO, MultipartFile image_file) throws Exception {
		
	    insertVO.setI_org_image(image_file.getOriginalFilename());
	    
	    String fileName = fileUploadService.fileUpload(image_file);
	    log.debug("넌 또 외안돼 {}",fileName);
	    insertVO.setI_up_image(fileName);
	    
	    setGalleryOptions(insertVO);
	    int ret = insertDao.insert(insertVO);
	    if (ret > 0) {
	        return insertVO;
	    }
		
		return null;
	}
	
	private void setGalleryOptions(InsertVO vo) {
		LocalDateTime lt = LocalDateTime.now();
		DateTimeFormatter date = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		DateTimeFormatter time = DateTimeFormatter.ofPattern("HH:mm:ss");
		vo.setI_id(UUID.randomUUID().toString());
		vo.setI_date(lt.format(date));
		vo.setI_time(lt.format(time));

	}

	/*
	 * MultiFile 을 업로드 했을때 사용할 method
	 */
	@Transactional
	@Override
	public List<InsertVO> createGallery(InsertVO insertVO, MultipartHttpServletRequest image_files)
			throws Exception {
		
		setGalleryOptions(insertVO);
		insertVO.setI_org_image("");
		insertVO.setI_up_image("");
//		String i_gid = galleryVO.getG_id();
		
		int gRet = insertDao.insert(insertVO);

		// mapper 의 selectKey 에서 설정한 g_id 값을 참조할수 있다.		
         String i_id = insertVO.getI_id();

		List<ImagesVO> resultNames = fileUploadService.filesUpload(image_files);

		int iRet = imagesDao.inserts(i_id, resultNames);
		return null;
	}

	
}
