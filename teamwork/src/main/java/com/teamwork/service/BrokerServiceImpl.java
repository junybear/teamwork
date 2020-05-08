package com.teamwork.service;

import com.teamwork.common.Util;
import com.teamwork.mapper.BrokerMapper;
import com.teamwork.vo.BrokerVO;
import com.teamwork.vo.MemberVO;

import lombok.Setter;

public class BrokerServiceImpl implements BrokerService {
	
	@Setter
	private BrokerMapper brokerMapper;

	@Override
	public void memberInster(MemberVO member) {
		String password = member.getPassword();
		String hashPw = Util.getHashedString(password, "SHA-256");
		
		member.setPassword(hashPw);

brokerMapper.insertMember(member);
		
	}

	@Override
	public void brokerInster(BrokerVO broker) {


		brokerMapper.insertBroker(broker);
		
	}

	@Override
	public void updateUser(MemberVO member) {
		member.setPassword(Util.getHashedString(member.getPassword(), "SHA-256"));
		brokerMapper.updateUser(member);
		
	}

	@Override
	public void updatebroker(BrokerVO broker) {
		brokerMapper.updatebroker(broker);
		
	}

}
