package com.nemo.nemo.dao;

import java.util.List;

import com.nemo.nemo.model.NemoVO;

public interface NemoDao {
	List<NemoVO> selectByNNum(int nNum);
	public List<NemoVO> selectAll();
}
