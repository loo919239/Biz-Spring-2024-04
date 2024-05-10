package com.callor.hello.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.hello.models.InsertVO;
import com.callor.hello.service.InsertService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {
	private final InsertService insertService;
	public HomeController(InsertService insertService) {
		super();
		this.insertService = insertService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<InsertVO> gList = insertService.selectAll();
		model.addAttribute("GALLERY", gList);
		model.addAttribute("BODY","HOME");
		return "layout";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert (Model model) {
		InsertVO insertVO = InsertVO.builder().i_up_image("noimage.png").i_org_image("noimage.png").build();
		model.addAttribute("GALLERY", insertVO);
		model.addAttribute("BODY","INSERT");
		return "layout";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(InsertVO galleryVO, @RequestParam("image_file") MultipartFile image_file,
			MultipartHttpServletRequest image_files, Model model) {
		log.debug("파일 업로드 {}", image_file.getOriginalFilename());

		String singleFileName = image_file.getOriginalFilename();
		InsertVO resultVO = null;
		try {
			if (!singleFileName.isEmpty()) {
				resultVO = insertService.createGallery(galleryVO, image_file);
			}
			/*
			 * Multi files 의 경우는 매개변수의 이름과 form 에서 전달한 이름은 전혀 연관이 없다. Multi 파일의 경우는
			 * 변수.getFiles() method 를 실행할때 form 에서 설정한 name 속성값을 매개변수로 전달한다.
			 */
			if (image_files.getFiles("image_files").size() > 0) {
				List<InsertVO> VOs = insertService.createGallery(galleryVO, image_files);
			}
			model.addAttribute("GALLERY", resultVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("IMAGE", image_file.getOriginalFilename());
		model.addAttribute("BODY","INSERT");
		return "layout";
	}
	
//	@RequestMapping(value = "/insert", method = RequestMethod.POST)
//	public String insert(InsertVO insertVO, @RequestParam("image_file") MultipartFile image_file,
//			MultipartHttpServletRequest image_files, Model model) {
//		log.debug("파일 업로드 {}", image_file.getOriginalFilename());
//
//		String singleFileName = image_file.getOriginalFilename();
//		InsertVO resultVO = null;
//		try {
//			if (!singleFileName.isEmpty()) {
//				resultVO = insertService.createGallery(insertVO, image_file);
//			}
//			/*
//			 * Multi files 의 경우는 매개변수의 이름과 form 에서 전달한 이름은 전혀 연관이 없다. Multi 파일의 경우는
//			 * 변수.getFiles() method 를 실행할때 form 에서 설정한 name 속성값을 매개변수로 전달한다.
//			 */
//			if (image_files.getFiles("image_files").size() > 0) {
//				List<InsertVO> VOs = insertService.createGallery(insertVO, image_files);
//			}
//			model.addAttribute("GALLERY", resultVO);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		model.addAttribute("IMAGE", image_file.getOriginalFilename());
//		
//		model.addAttribute("BODY","INSERT");
//		return "layout";
//	}
	
}
