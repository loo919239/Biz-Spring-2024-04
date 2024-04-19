package com.nemo.nemo.dao;

import java.util.List;
import com.nemo.nemo.model.UserNemoVO;

public interface UserNemoDao {
	public List<UserNemoVO> selectAll(String p_id, String p_num);
}
