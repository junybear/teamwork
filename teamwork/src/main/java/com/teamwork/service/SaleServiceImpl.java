package com.teamwork.service;

import java.util.HashMap;
import java.util.List;


import com.teamwork.mapper.SaleMapper;
import com.teamwork.vo.SaleVO;

import lombok.Setter;

public class SaleServiceImpl implements SaleService {

	@Setter
	private SaleMapper saleMapper;

	@Override
	public List<SaleVO> findBoard() {
		
		return saleMapper.selectSale();
	}

	@Override
	public int writeSale(SaleVO sale) {
		
		saleMapper.insertSale(sale);
		return sale.getNo();
	}

	@Override
	public List<SaleVO> findNoticeWithPaging(HashMap<String, Object> params) {
		
		return saleMapper.selectSaleWithPaging(params);
	}

	@Override
	public int findSaleCount(HashMap<String, Object> params) {
		
		return saleMapper.selectSaleCount(params);
	}

	@Override
	public SaleVO findSaleByNo(int no) {
		
		return saleMapper.selectSaleByNo(no);
	}

	@Override
	public void deleteNotice(int no) {
		
		saleMapper.deleteSale(no);
		
	}
	
	
	


}
