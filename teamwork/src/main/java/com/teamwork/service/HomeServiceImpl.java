package com.teamwork.service;

import java.util.List;

import com.teamwork.mapper.HomeMapper;
import com.teamwork.vo.SaleVO;

import lombok.Setter;

public class HomeServiceImpl implements HomeService {
	
	@Setter HomeMapper homeMapper;

	@Override
	public List<SaleVO> findBoard() {
		// TODO Auto-generated method stub
		return homeMapper.selectSale();
	}

}
