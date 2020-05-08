package com.teamwork.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamwork.vo.NoticeVO;

@Mapper
public interface NoticeMapper {

	void insertNotice(NoticeVO notice);
	
	List<NoticeVO> selectNoticeWithPaging(HashMap<String, Object> params);

	int selectNoticeCount(HashMap<String, Object> params);

	List<NoticeVO> selectNotice();

	NoticeVO selectNoticeByNo(int no);

	void deleteNotice(int no);

	


}








