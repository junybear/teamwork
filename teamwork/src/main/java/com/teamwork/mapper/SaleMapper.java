package com.teamwork.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamwork.vo.SaleVO;

@Mapper
public interface SaleMapper {

	List<SaleVO> selectSale();

	void insertSale(SaleVO sale);

	List<SaleVO> selectSaleWithPaging(HashMap<String, Object> params);

	int selectSaleCount(HashMap<String, Object> params);

	SaleVO selectSaleByNo(int no);

	void deleteSale(int no);

	

}
