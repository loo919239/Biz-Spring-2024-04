package com.callor.hello.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.callor.hello.models.ImagesVO;

public interface ImagesDao extends GenericDao<ImagesVO, String>{
	public int inserts(@Param("i_id") String i_gid, @Param("images") List<ImagesVO> resultNames);
}
