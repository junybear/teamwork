package com.teamwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamwork.vo.SaleVO;

@Mapper
public interface HomeMapper {

	List<SaleVO> selectSale();

}
