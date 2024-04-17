package com.callor.bbs.dao;

import java.util.List;

import com.callor.bbs.models.UserVO;

public interface UserDao {
	public List<UserVO> selectAll();
}
