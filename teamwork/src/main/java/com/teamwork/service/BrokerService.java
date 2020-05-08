package com.teamwork.service;

import org.springframework.stereotype.Service;

import com.teamwork.vo.BrokerVO;
import com.teamwork.vo.MemberVO;

@Service
public interface BrokerService {

	void memberInster(MemberVO member);

	void brokerInster(BrokerVO broker);

	void updateUser(MemberVO member);

	void updatebroker(BrokerVO broker);

}
