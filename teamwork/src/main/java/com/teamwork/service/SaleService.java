package com.teamwork.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.teamwork.vo.SaleImageVO;
import com.teamwork.vo.SaleVO;

public interface SaleService {

	List<SaleVO> findBoard();

	List<SaleVO> findNoticeWithPaging(HashMap<String, Object> params);

	int findSaleCount(HashMap<String, Object> params);

	SaleVO findSaleByNo(int no);

	void deleteNotice(int no);

	int writeSale(SaleVO sale);
	
	List<SaleVO> findTop6Sales();



}
