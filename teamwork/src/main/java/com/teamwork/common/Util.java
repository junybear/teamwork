package com.teamwork.common;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

import javax.activation.DataSource;
import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.FileImageOutputStream;
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
	   
//////////////////////////////////////////////////////////////////
	/**
	 * 특정 폴더에서 고유한 파일 이름을 만드는 메서드 <br>
	 * 파일이름이 중복되면 뒤에 .1, .2와 같은 접미사 추가
	 * 
	 * @param path
	 * @param fileName
	 * @return
	 */
	public static String makeUniqueFileName(String path, String fileName) {
		String name = fileName.substring(0, fileName.lastIndexOf("."));
		String ext = fileName.substring(fileName.lastIndexOf("."));

		int index = 1;
		while (true) {
			File file = new File(path + "\\" + name + "_" + index + ext);
			if (file.exists())
				index++;
			else
				break;
		}

		return name + "_" + index + ext;
	}

	/**
	 * 고유한 파일 이름을 만드는 메서드
	 * 
	 * @param fileName
	 * @return
	 */
	public static String makeUniqueFileName(String fileName) {
		String ext = fileName.substring(fileName.lastIndexOf("."));

		String name = UUID.randomUUID().toString();

		return name + ext;
	}

///////////////////////////////////////////////////

	public static String makeQueryString(String queryString, String toAdd, String[] toRemove, String encoding)
			throws UnsupportedEncodingException {

		if (queryString == null || queryString.length() == 0) {
			return null;
		}
		if (encoding == null || encoding.length() == 0) {
			encoding = "utf-8";
		}
		queryString = queryString.replace("?", "");
		String[] ar = queryString.split("&");
		HashMap<String, String> result = new HashMap<>();
		for (String q : ar) {
			String[] ar2 = q.split("=");
			if (ar2.length != 2) {
				throw new RuntimeException("Invalid Format");
			}
			result.put(ar2[0], new String(ar2[1].getBytes(encoding), "ISO-8859-1"));
		}

		if (toRemove != null && toRemove.length > 0) {
			for (String d : toRemove) {
				result.remove(d);
			}
		}

		if (toAdd != null && toAdd.length() > 0) {
			ar = toAdd.trim().split("&");
			for (String a : ar) {
				String[] ar2 = a.split("=");
				if (ar2.length != 2) {
					throw new RuntimeException("Invalid Format");
				}
				result.replace(ar2[0], new String(ar2[1].getBytes(encoding), "ISO-8859-1"));
			}
		}

		Set<String> keys = result.keySet();
		StringBuilder sb = new StringBuilder();
		for (String key : keys) {
			sb.append(String.format("&%s=%s", key, result.get(key)));
		}
		sb = sb.replace(0, 1, "?");

		return sb.toString();
	}

	public static String createThumbnail(String filePath, String fileName, int maxSize) {
		String newFileName = null;
		try {
			int thumbnail_width = maxSize;
			int thumbnail_height = maxSize;

			File origin_file_name = new File(filePath, fileName);

			String ext = getFileExt(fileName);
			newFileName = fileName.replace("." + ext, ".thumbnail." + ext);

			BufferedImage buffer_original_image = ImageIO.read(origin_file_name);

			double imgWidth = buffer_original_image.getWidth();
			double imgHeight = buffer_original_image.getHeight();

			if (imgWidth < imgHeight) {
				thumbnail_width = (int) ((imgWidth / imgHeight) * maxSize);
			} else {
				thumbnail_height = (int) ((imgHeight / imgWidth) * maxSize);
			}

			int imgType = (buffer_original_image.getTransparency() == Transparency.OPAQUE) ? BufferedImage.TYPE_INT_RGB
					: BufferedImage.TYPE_INT_ARGB;
			BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, imgType);
			Graphics2D graphic = buffer_thumbnail_image.createGraphics();

			graphic.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
			graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);

			if (ext.equalsIgnoreCase("jpg")) {
				writeJpeg(buffer_thumbnail_image, filePath, newFileName, 1.0f);
			} else {
				File thumb_file_name = new File(newFileName);
				ImageIO.write(buffer_thumbnail_image, ext.toLowerCase(), thumb_file_name);
			}

			graphic.dispose();
		} catch (Exception e) {
			e.printStackTrace(System.err);
			return null;
		}

		return newFileName;
	}

	private static String getFileExt(String fileName) { // "abc.txt" -> "txt", not ".txt"
		int i = fileName.lastIndexOf('.');
		int p = Math.max(fileName.lastIndexOf('/'), fileName.lastIndexOf('\\'));

		if (i > p) {
			return fileName.substring(i + 1);
		}

		return null;
	}

	private static void writeJpeg(BufferedImage image, String destFilePath, String destFile, float quality)
			throws IOException {
		ImageWriter writer = null;
		FileImageOutputStream output = null;

		try {
			writer = ImageIO.getImageWritersByFormatName("jpeg").next();

			ImageWriteParam param = writer.getDefaultWriteParam();

			param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
			param.setCompressionQuality(quality);

			output = new FileImageOutputStream(new File(destFilePath, destFile));
			writer.setOutput(output);

			IIOImage iioImage = new IIOImage(image, null, null);
			writer.write(null, iioImage, param);
		} catch (IOException ex) {
			throw ex;
		} finally {
			if (writer != null) {
				writer.dispose();
			}

			if (output != null) {
				output.close();
			}
		}
	}
}
