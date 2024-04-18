package com.callor.gallery.controller.dao;

import java.util.List;

import com.callor.gallery.controller.models.UserVO;

public interface UserDao {
	public List<UserVO> selectAll();
}
