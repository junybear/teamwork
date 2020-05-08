package com.teamwork.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamwork.vo.MemberVO;

@Service
public interface MemberService {
	
	void registerMember(MemberVO member);

	MemberVO findMember(MemberVO member);

	int idcheck(String mid);

	MemberVO brokerFind(MemberVO member);

	MemberVO findId(MemberVO member);

	int emailck(String email);
	
	MemberVO getUserEmail(String email);

	boolean MailService(String subject, String text, String from, String to);

	void getUserPass(MemberVO user);

	void updateMember(MemberVO member);

	



}
