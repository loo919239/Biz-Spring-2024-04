package com.callor.iolist.persistance;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.callor.iolist.models.IoListVO;

public interface IoListDao {

	@Select("SELECT * FROM tbl_iolist ORDER BY io_seq")
	public List<IoListVO> selectAll();
	
	@Select("SELECT * FROM tbl_iolist WHERE io_seq = #{ioSeq}")
	public IoListVO findById(String ioSeq);

	public int insert(IoListVO vo);

	public int update(IoListVO ioListVO);
	
	@Delete("DELETE FROM tbl_iolist WHERE io_seq= #{ioSeq}")
	public int delete(String ioSeq);


}
