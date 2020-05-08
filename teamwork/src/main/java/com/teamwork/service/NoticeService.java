package com.teamwork.service;

import java.util.HashMap;
import java.util.List;

import com.teamwork.vo.NoticeVO;

public interface NoticeService {

	int writeNotice(NoticeVO notice);

	List<NoticeVO> findNoticeWithPaging(HashMap<String, Object> params);

	int findNoticeCount(HashMap<String, Object> params);

	List<NoticeVO> findBoard();

	NoticeVO findNoticeByNo(int no);

	void deleteNotice(int no);

	
}
