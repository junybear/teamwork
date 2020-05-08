package com.teamwork.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.teamwork.vo.BrokerVO;
import com.teamwork.vo.MemberVO;

@Mapper
public interface BrokerMapper {

	void insertMember(MemberVO member);

	void insertBroker(BrokerVO broker);

	void updateUser(MemberVO member);

	void updatebroker(BrokerVO broker);

}
