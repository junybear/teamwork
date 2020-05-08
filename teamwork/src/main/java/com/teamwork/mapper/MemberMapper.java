package com.teamwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamwork.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	void insertMember(MemberVO member);

	MemberVO selectMember(MemberVO member);

	int idcheck(String mid);

	MemberVO brokerFind(MemberVO member);
	
	MemberVO findId(MemberVO member);

	int emailck(String email);

	void getUserPass(MemberVO user);

	MemberVO getUserEmail(String email);

	void updateMember(MemberVO member);

	

	

	

}
