package com.teamwork.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.log4j2.Log4j2AbstractLoggerImpl;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamwork.common.Util;
import com.teamwork.service.MemberService;
import com.teamwork.vo.MemberVO;

@Controller
@RequestMapping(path = {"/user"})
public class AccountController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@RequestMapping(path= {"/register"})
	   public String memberWrite() {
	      System.out.println("%%%^%^%%%%%^");
	      return "user/register";
	   }
	
	
	@RequestMapping(value = "/registerInsert")
	   public String register(MemberVO member, RedirectAttributes redirectAttributes) {
	      System.out.println("#############");
	      memberService.registerMember(member);
	      System.out.println("#############");
	      redirectAttributes.addFlashAttribute("msg", "REGISTERED");
	      return "redirect:/";
	   }
	
	@RequestMapping(path= {"/login"})
	public String loginWrite() {
		return "user/login";
	}
	

	@RequestMapping(value = "/loginSelect")
	
	public String login(MemberVO member, HttpSession session, RedirectAttributes rttr ) {
		System.out.println("@#@#@#@#");
		
		MemberVO member2 = memberService.findMember(member);
		MemberVO member3 = memberService.brokerFind(member);
		 System.out.println(member3);
		System.out.println(member2);
		if (member2 == null) {
			session.setAttribute("loginuser", null);
			rttr.addFlashAttribute("msg",false);
			return "redirect:/user/login";
		}else {
			 
			
			session.setAttribute("loginuser", member2);
			session.setAttribute("logionbroker", member3);
		}
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginuser");
		return "redirect:/";
	}

	@RequestMapping("/idCheck")
	@ResponseBody
	public Map<String, Integer> idcheck(@RequestBody String mid) {
		System.out.println("************");
		int count = 0;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		count = memberService.idcheck(mid);
		map.put("cnt", count);
		
		return map;
	}
	
	@RequestMapping("/emailCheck")
	@ResponseBody
	public Map<String, Integer> emailcheck(@RequestBody String email) {
		System.out.println("+++++++++");
		int count = 0;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		count = memberService.emailck(email);
		map.put("cnt", count);
		
		return map;
	}
	
	@RequestMapping(value = "/findIdView")
	public String findIdView() {
		
		return "user/findId";
	}
	
	@RequestMapping(value = "findId")
	public String findId(MemberVO member,Model model) {
		
		 
		MemberVO mem = memberService.findId(member);
		model.addAttribute("member",mem );
		return "user/findIdView";
	}
	
	 @RequestMapping(value="/findPasswordView", method = RequestMethod.GET)
     public String findPasswordView() {
        return "user/findPassword";
     }
   
   // 비밀번호찾기,임시비밀번호 발급
     @RequestMapping(value="/findPassword", method = RequestMethod.POST)
     public String sendMailPass(HttpSession session, String password, Model model,
           @RequestParam String email, @RequestParam String mid){
        
        // 파라미터 값 확인
        System.out.println("user_pass : " + password);
        System.out.println("사용자가 입력한 이메일 : " + email);
        System.out.println("사용자가 입력한 아이디 : " + mid);
        
        // 사용자 입력 이메일 값으로 DB 정보 조회
        MemberVO user = memberService.getUserEmail(email);
        
        // 체크 변수
        int check = 0;
        
        if(user != null) {
           if(!user.getMid().equals(mid)) {   // 해당 이메일을 가진 회원은 존재하나 아이디 입력값이 틀린 경우
              System.out.println("입력한 이메일의 회원정보가 일치하지 않습니다.");
              model.addAttribute("check", check);
              System.out.println("View에 전달될 check 값 : " + check);
              return "/user/findPassword";
           }
           
           // 해당 회원이 존재할 경우
           int ran = new Random().nextInt(100000) + 10000;
           password = String.valueOf(ran);
           
           // UserMemberVO를 하나 만들어서 set 메소드로 id, pass 세팅
           user.setMid(mid);
           user.setPassword(password);
           
           memberService.getUserPass(user);
           System.out.println("사용자에게 안내할 사용자 아이디 :" + user.getMid());
           System.out.println("사용자에게 안내할 사용자 이메일 :" + user.getEmail());
           
           String subject = "임시 비밀번호 발급 안내 입니다.";
              StringBuilder sb = new StringBuilder();
              sb.append("임시 비밀번호는 " + password + " 입니다.");
              memberService.MailService(subject, sb.toString(), "aajj6540@gmail.com", email);
              
              System.out.println(password + "임시 비밀번호 발송!!!");
              
              // 임시 비밀번호 발송 후 DB에 있는 회원의 비밀번호도 임시 비밀번호 값으로 변경한다.
              System.out.println("임시 비밀번호 발송 후:" + user.getPassword());
              
              // check 값을 1로 변경 후 model에 담아서 전송
              check = 1;
              model.addAttribute("check", check);
              System.out.println("View에 전달될 check 값 : " + check);
              
        } else {   // 입력한 이메일, 아이디에 해당하는 회원이 존재하지 않을 경우
           System.out.println("이메일로 가입된 아이디가 없습니다");
           model.addAttribute("check", check);
           System.out.println("View에 전달될 check 값 : " + check);
        }
        return "/user/findPassword";
     }
     
     @RequestMapping(value = "/sendMail", method = RequestMethod.POST)
     @ResponseBody
     public String sendMailAuth(HttpSession session, @RequestParam(value = "user_email") String email) {
        System.out.println(email + "샌드메일이메일");
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);

        String subject = "회원가입 인증 코드 발급 안내 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");

        memberService.MailService(subject, sb.toString(), "aajj6540@gmail.com", email);
        System.out.println(joinCode);
        return joinCode;
     }
     
     @RequestMapping(value = "/userProfileModifyView")
     public String userProfile() {
    	
    	
    	 return "/user/userProfileModify";
     }
     
     @RequestMapping(value = "/userProfileModify")
     public String userProfileModify(MemberVO member) {
    	 
    	 memberService.updateMember(member);
    	 
    	 System.out.println("1111111111111111111111111111111");
    	 System.out.println(member);
    	 
    	
    	 
    	 return "redirect:/";
     }
	

}
