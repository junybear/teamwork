package com.teamwork.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class SaleVO {
	
	private int no;
	private int mno;
	private int price;
	private String list;
	private Date bdate;
	private boolean deleted;
	private String stitle;
	private String scontent;
	private String bathroom;
	private String bedroom;
	private String parking;
	private String address;
	private String swriter;
	private String sphone;
	
	private List<SaleImageVO> imageList;

}
