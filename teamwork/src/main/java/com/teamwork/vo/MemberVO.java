package com.teamwork.vo;

import lombok.Data;

@Data
public class MemberVO {
	
	private int mno;
	
	private String mid;
	
	private String password;
	
	private String email;
	
	private String birthday;
	
	private String gender;
	
	private String phone;
	
	private String authority;
	
	
	
	
	
	private BrokerVO broker;
	
	private int no;//중개인 번호
	
	private String corporate;//사업자 번호
	
	private String corporateName;//사업장명
	
	private String corporateAddress;//사업장 주소
	
	private String corporateCeo;//사업장 대표

}
