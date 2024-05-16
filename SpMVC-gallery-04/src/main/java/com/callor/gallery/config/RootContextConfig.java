package com.callor.gallery.config;

import java.io.IOException;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class RootContextConfig {
	
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver getFileResolver() throws IOException {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		
		resolver.setMaxUploadSize(1024 * 1024 * 2);
		resolver.setMaxUploadSizePerFile(1024 * 1024 * 20);
		
		resolver.setUploadTempDir(new FileSystemResource("c:/temp"));
		resolver.setDefaultEncoding("UTF-8");
		
		return resolver; 
	}
	
}
