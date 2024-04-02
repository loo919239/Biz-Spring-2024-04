package com.callor.hello.persistance;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.callor.hello.models.OrderCustomerVO;
import com.callor.hello.sql.TableSQL;

public interface OrderCustomerDao {
	
//	@Select(TableSQL.ORDER_CUSTOM)
	public List<OrderCustomerVO> selectAll(); 

}
