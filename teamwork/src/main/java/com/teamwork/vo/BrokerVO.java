package com.teamwork.vo;

import lombok.Data;

@Data
public class BrokerVO {
	
	private int no;//중개인 번호
	
	private int mno;// 회원번호
	
	private String corporate;//사업자 번호
	
	private String corporateName;//사업장명
	
	private String corporateAddress;//사업장 주소
	
	private String corporateCeo;//사업장 대표

}
