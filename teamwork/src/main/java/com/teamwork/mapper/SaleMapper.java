package com.teamwork.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamwork.vo.SaleImageVO;
import com.teamwork.vo.SaleVO;

@Mapper
public interface SaleMapper {

	List<SaleVO> selectSale();

	void insertSale(SaleVO sale);

	List<SaleVO> selectSaleWithPaging(HashMap<String, Object> params);
	
	List<SaleImageVO> selectSaleImageBySaleNo(int no);
	
	int selectSaleCount(HashMap<String, Object> params);

	SaleVO selectSaleByNo(int no);

	void deleteSale(int no);

	void insertImages(SaleImageVO image);
	
	List<SaleVO> selectTop6Sales();

	

}
