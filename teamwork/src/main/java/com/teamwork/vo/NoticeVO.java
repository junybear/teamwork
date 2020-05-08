package com.teamwork.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int no;
	private int mno;
	private String title;
	private String content;
	private Date ndate;
	private boolean deleted;

}
