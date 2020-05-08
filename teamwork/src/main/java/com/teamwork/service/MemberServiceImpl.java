package com.teamwork.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.teamwork.common.Util;
import com.teamwork.mapper.MemberMapper;
import com.teamwork.vo.MemberVO;

import lombok.Setter;

public class MemberServiceImpl implements MemberService {
	
	@Setter
	private MemberMapper memberMapper;
	
	
	
	@Override
	public void registerMember(MemberVO member) {
	
		String password = member.getPassword();
		String hashPw = Util.getHashedString(password, "SHA-256");
		
		member.setPassword(hashPw);
		
		memberMapper.insertMember(member);
		
	
		
	}

	@Override
	public MemberVO findMember(MemberVO member) {

		member.setPassword(Util.getHashedString(member.getPassword(), "SHA-256"));
		
		return memberMapper.selectMember(member);
	}

	@Override
	public int idcheck(String mid) {
		// TODO Auto-generated method stub
		return memberMapper.idcheck(mid);
	}

	@Override
	public MemberVO brokerFind(MemberVO member) {
		// TODO Auto-generated method stub
		return memberMapper.brokerFind(member);
	}
	
	@Override
	public MemberVO findId(MemberVO member) {
		
		return memberMapper.findId(member);
	}

	@Override
	public int emailck(String email) {
		// TODO Auto-generated method stub
		return memberMapper.emailck(email);
	}
	
	@Override
	   public MemberVO getUserEmail(String email) {
	      
	      return memberMapper.getUserEmail(email);
	   }

	   

	   @Override
	   public void getUserPass(MemberVO user) {
		   
		   user.setPassword(Util.getHashedString(user.getPassword(), "SHA-256"));
	      memberMapper.getUserPass(user);
	      
	   }
	   
	   private JavaMailSender javaMailsender;
	   @Autowired
	   public void setJavaMailSender(JavaMailSender javaMailsender) {
	      this.javaMailsender = javaMailsender;
	   }

	   @Override
	   public boolean MailService(String subject, String text, String from, String to) {
	      
	      MimeMessage message = javaMailsender.createMimeMessage();
	      
	      try {
	          MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
	          
	          helper.setSubject(subject);
	          helper.setText(text, true);
	          helper.setFrom(from);
	          helper.setTo(to);
	          javaMailsender.send(message);
	          return true;
	      } catch ( MessagingException e) {
	         e.printStackTrace();
	      }
	      
	      return false;
	   }

	@Override
	public void updateMember(MemberVO member) {
		member.setPassword(Util.getHashedString(member.getPassword(), "SHA-256"));
		memberMapper.updateMember(member);
		
	}

	

}
