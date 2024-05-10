package com.callor.hello.dao;

import com.callor.hello.models.InsertVO;

public interface InsertDao extends GenericDao<InsertVO, String>{
	public InsertVO findByID(String pk);
}
