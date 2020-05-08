package com.teamwork.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamwork.vo.NoticeVO;
import com.teamwork.service.NoticeService;
import com.teamwork.ui.ThePager2;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(path = { "/notice" })
@Log4j
public class NoticeController {
	
	@Autowired
	@Qualifier("noticeService")
	private NoticeService noticeService;

	
	@GetMapping(path = { "/list2" })
	public String list2(Model model) { // 목록보기
		
		//데이터 조회 (서비스에 요청)
		List<NoticeVO> notices = noticeService.findBoard();
		
		//Model 타입 전달인자에 데이터 저장 -> View로 전달
		//(실제로는 Request 객체에 데이터 저장)
		model.addAttribute("noticeBoard", notices);
		
		return "notice/list"; // /WEB-INF/views/ + board/list + .jsp
	}
	
	
	@GetMapping(path = { "/list" })
	public String showListForm(@RequestParam(defaultValue = "1")int pageNo,
				HttpServletRequest req, Model model) { //  리스트 화면 보기
		
		int pageSize = 3;
		int pagerSize = 3;
		HashMap<String, Object> params = new HashMap<>();
		int beginning = (pageNo - 1) * pageSize + 1;
		params.put("beginning", beginning);
		params.put("end",beginning + pageSize);
		
		List<NoticeVO> notices = noticeService.findNoticeWithPaging(params);
		int boardCount = noticeService.findNoticeCount(params);
		
		ThePager2 pager = new ThePager2(boardCount, pageNo, pageSize, pagerSize, "list", req.getQueryString());
		
		
		model.addAttribute("noticeBoard", notices);
		model.addAttribute("pager", pager);
		
		
		return "notice/list";
	}
	
	@GetMapping(path = { "/write" })
	public String showWriteForm() { // 글쓰기 화면 보기

		return "notice/write";
	}
	
	@PostMapping(path = { "/write" })
	public String write(NoticeVO notice, RedirectAttributes attr) {


		int newNoticeNo = noticeService.writeNotice(notice);


		attr.addFlashAttribute("newNo", newNoticeNo);
		return "redirect:list";
	}
	
	@GetMapping(path = { "/detail" })
	public String showDetail(int no, 
			@RequestParam(defaultValue = "1") int pageNo, Model model, 
			HttpServletRequest req,
			HttpServletResponse resp) {

		NoticeVO notices = noticeService.findNoticeByNo(no);
		if (notices == null) {
			return "redirect:list";
		}


	 
		// 2. 조회된 데이터를 View에서 사용할 수 있도록 저장
		model.addAttribute("noticeBoard", notices);

		// 3. View로 이동
		return "notice/detail";
	}
	
	@GetMapping(path = { "/delete" })
	public String delete(int no, int pageNo) {
		
		noticeService.deleteNotice(no);
		
		return String.format("redirect:list?pageNo=%d", pageNo);
	}
	

	
}
