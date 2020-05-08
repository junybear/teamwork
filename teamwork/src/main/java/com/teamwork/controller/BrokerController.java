package com.teamwork.controller;

import java.io.Console;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamwork.service.BrokerService;
import com.teamwork.vo.BrokerVO;
import com.teamwork.vo.MemberVO;

@Controller
@RequestMapping(path = {"/broker"})
public class BrokerController {
	
	@Autowired
	@Qualifier("brokerService")
	private BrokerService brokerService;
	
	@RequestMapping(path= {"/brokerRegister"})
	   public String memberWrite() {
	      System.out.println("%%%^%^%%%%%^");
	      return "broker/brokerRegister";
	   }
	
	@RequestMapping(path= {"/brokerInsert"})
	public String brokerInsert(MemberVO member, BrokerVO broker) {
		
		brokerService.memberInster(member);
		
		brokerService.brokerInster(broker);
		
		
		return "redirect:/";
	}
	@RequestMapping(path= {"/brokerProfileModifyView"})
	public String brokerProfileModifyView() {
		System.out.println("중개인 정보수정 화면");
		return "broker/brokerProfileModify";
	}
	
	@RequestMapping(path = {"/brokerProfileModify"})
	public String brokerProfileModify(MemberVO member, BrokerVO broker) {
		
		brokerService.updateUser(member);
		
		brokerService.updatebroker(broker);
		
		return "redirect:/";
	}
	
	

}
