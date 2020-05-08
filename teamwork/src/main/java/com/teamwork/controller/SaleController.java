package com.teamwork.controller;

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

import com.teamwork.service.SaleService;
import com.teamwork.ui.ThePager2;
import com.teamwork.vo.NoticeVO;
import com.teamwork.vo.SaleVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(path = { "/sale" })
@Log4j
public class SaleController {
	
	@Autowired
	@Qualifier("saleService")
	private SaleService saleService;
	
	@GetMapping(path = { "list2" })
	public String list(Model model) {
		List<SaleVO> sales = saleService.findBoard();
		
		model.addAttribute("saleBoard", sales);
		
		return "sale/list";
	}
	
	@GetMapping(path = { "/list" })
	public String showListForm(@RequestParam(defaultValue = "1")int pageNo,
				HttpServletRequest req, Model model) { //  리스트 화면 보기
		
		int pageSize = 9;
		int pagerSize = 3;
		HashMap<String, Object> params = new HashMap<>();
		int beginning = (pageNo - 1) * pageSize + 1;
		params.put("beginning", beginning);
		params.put("end",beginning + pageSize);
		
		List<SaleVO> sales = saleService.findNoticeWithPaging(params);
		int boardCount = saleService.findSaleCount(params);
		
		ThePager2 pager = new ThePager2(boardCount, pageNo, pageSize, pagerSize, "list", req.getQueryString());
		
		
		model.addAttribute("saleBoard", sales);
		model.addAttribute("pager", pager);
		
		
		return "sale/list";
	}
	
	@GetMapping(path = { "/write" })
	public String showWriteForm() { // 글쓰기 화면 보기

		return "sale/write";
	}
	
	@PostMapping(path = { "/write" })
	public String write(SaleVO sale, RedirectAttributes attr) {


		int newSaleNo = saleService.writeSale(sale);
		attr.addFlashAttribute("newNo", newSaleNo);

		return "redirect:list";
	}
	
	@GetMapping(path = { "/detail" })
	public String showDetail(int no, 
			@RequestParam(defaultValue = "1") int pageNo, Model model, 
			HttpServletRequest req,
			HttpServletResponse resp) {

		SaleVO sales = saleService.findSaleByNo(no);
		if (sales == null) {
			return "redirect:list";
		}


	 
		// 2. 조회된 데이터를 View에서 사용할 수 있도록 저장
		model.addAttribute("saleBoard", sales);

		// 3. View로 이동
		return "sale/detail";
	}
	
	@GetMapping(path = { "/delete" })
	public String delete(int no, int pageNo) {
		
		saleService.deleteNotice(no);
		
		return String.format("redirect:list?pageNo=%d", pageNo);
	}
	

}
