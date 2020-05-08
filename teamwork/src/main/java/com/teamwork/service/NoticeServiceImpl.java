package com.teamwork.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.teamwork.mapper.NoticeMapper;
import com.teamwork.vo.NoticeVO;

import lombok.Setter;

public class NoticeServiceImpl implements NoticeService {

	@Setter
	private NoticeMapper noticeMapper;
	
	@Override
	public int writeNotice(NoticeVO notice) {
		
		noticeMapper.insertNotice(notice);
		return notice.getNo();
	}

	@Override
	public List<NoticeVO> findNoticeWithPaging(HashMap<String, Object> params) {
		
		return noticeMapper.selectNoticeWithPaging(params);
	}

	@Override
	public int findNoticeCount(HashMap<String, Object> params) {
		
		return noticeMapper.selectNoticeCount(params);
	}

	@Override
	public List<NoticeVO> findBoard() {

		return noticeMapper.selectNotice();
	}

	@Override
	public NoticeVO findNoticeByNo(int no) {
		
		return noticeMapper.selectNoticeByNo(no);
	}

	@Override
	public void deleteNotice(int no) {
		
		noticeMapper.deleteNotice(no);
		
	}

	


}
