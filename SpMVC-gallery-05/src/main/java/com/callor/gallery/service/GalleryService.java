package com.callor.gallery.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.gallery.modles.GalleryVO;

public interface GalleryService {
	
	public List<GalleryVO> selectAll();
	public GalleryVO selectGalleryOne(String gid);
	public int createGallerys(GalleryVO gallertyVO, MultipartHttpServletRequest files);
	public int delete(String id);
	

}
