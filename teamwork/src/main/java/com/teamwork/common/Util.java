package com.teamwork.common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class Util {
	/**
	 * 지정된 암호화 알고리즘에 따라 문자열 데이터를 암호화 처리
	 * 
	 * @param source 암호화 대상 문자열
	 * @param algorithm 암호화 알고리즘 문자열 (SHA-1, MD5, SHA-256 ...)
	 * @return 암호화된 데이터
	 */
	public static byte[] getHashedData(String source, String algorithm) {
		
		byte[] hashedData = null;
		
		try {
			//암호화 처리 인스턴스 생성
			MessageDigest md = MessageDigest.getInstance(algorithm);
			hashedData = md.digest(source.getBytes());//지정된 알고리즘으로 암호화
		} catch (NoSuchAlgorithmException ex) {	
			hashedData = null;
		}
		
		return hashedData;
	}
	
	/**
	 * 문자열을 암호화 알고리즘에 따라 암호화 하고 결과를 문자열로 변환
	 * @param source
	 * @param algorithm
	 * @return
	 */
	public static String getHashedString(String source, String algorithm) {
		
		byte[] hashedData = getHashedData(source, algorithm);
		
		if (hashedData == null) return null;
		 
		String hashedString = "";
		for (int i = 0; i < hashedData.length; i++) {
			String hexString = 
				Integer.toHexString((int)hashedData[i] & 0x000000ff);
			if (hexString.length() < 2)
				hexString = "0" + hexString;
			
			hashedString += hexString;
		}
		
		return hashedString;
	}
	
	 // 인증키 생성
	   public class TempKey {
	        private boolean lowerCheck;
	          private int size;

	          public String getKey(int size, boolean lowerCheck) {
	              this.size = size;
	              this.lowerCheck = lowerCheck;
	              return init();
	          }

	          private String init() {
	              Random ran = new Random();
	              StringBuffer sb = new StringBuffer();
	              int num = 0;
	              do {
	                  num = ran.nextInt(75)+48;
	                  if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
	                      sb.append((char)num);
	                  }else {
	                      continue;
	                  }
	              } while (sb.length() < size);
	              if(lowerCheck) {
	                  return sb.toString().toLowerCase();
	              }
	              return sb.toString();
	          }



	}
	   
	   public class MailHandler {
	       private JavaMailSender mailSender;
	        private MimeMessage message;
	        private MimeMessageHelper messageHelper;

	        public MailHandler(JavaMailSender mailSender) throws MessagingException {
	            this.mailSender = mailSender;
	            message = this.mailSender.createMimeMessage();
	            messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	        }

	        public void setSubject(String subject) throws MessagingException {
	            messageHelper.setSubject(subject);
	        }
	        public void setText(String htmlContent) throws MessagingException {
	            messageHelper.setText(htmlContent, true);
	        }
	        public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
	            messageHelper.setFrom(email, name);
	        }
	        public void setTo(String email) throws MessagingException {
	            messageHelper.setTo(email);
	        }
	        public void addInline(String contentId, DataSource dataSource) throws MessagingException {
	            messageHelper.addInline(contentId, dataSource);
	        }
	        public void send() {
	            mailSender.send(message);
	        }

	}   
}
