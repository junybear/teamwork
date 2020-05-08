package com.teamwork.service;

import java.util.HashMap;
import java.util.List;

import com.teamwork.vo.SaleVO;

public interface SaleService {

	List<SaleVO> findBoard();

	int writeSale(SaleVO sale);

	List<SaleVO> findNoticeWithPaging(HashMap<String, Object> params);

	int findSaleCount(HashMap<String, Object> params);

	SaleVO findSaleByNo(int no);

	void deleteNotice(int no);


}
