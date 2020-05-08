package com.teamwork.controller;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamwork.common.Util;
import com.teamwork.service.SaleService;
import com.teamwork.ui.ThePager2;
import com.teamwork.vo.SaleImageVO;
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
	public String showListForm(@RequestParam(defaultValue = "1") int pageNo, HttpServletRequest req, Model model) { // 리스트
																													// 화면
																													// 보기

		int pageSize = 9;
		int pagerSize = 3;
		HashMap<String, Object> params = new HashMap<>();
		int beginning = (pageNo - 1) * pageSize + 1;
		params.put("beginning", beginning);
		params.put("end", beginning + pageSize);

		List<SaleVO> sales = saleService.findNoticeWithPaging(params);

		System.out.println(sales);

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
	public String write(SaleVO sale, RedirectAttributes attr, MultipartHttpServletRequest req) {

		List<SaleImageVO> images = parseAndSaveUploadImages(req);
		sale.setImageList(images);

		int newSaleNo = saleService.writeSale(sale);
		attr.addFlashAttribute("newNo", newSaleNo);

		return "redirect:list";
	}



	@GetMapping(path = { "/detail" })
	public String showDetail(@RequestParam("no") int no, Model model) {

		System.out.println(no);
		
		SaleVO sales = saleService.findSaleByNo(no);
		//SaleVO sales = saleService.findSaleByNo(no); 
		
		
		if (sales == null) {
			return "redirect:list";
		}

		// 2. 조회된 데이터를 View에서 사용할 수 있도록 저장
		model.addAttribute("saleBoard", sales);
		System.out.println("----------------------");
		System.out.println(sales.getImageList());

		// 3. View로 이동
		return "sale/detail";
	}

	@GetMapping(path = { "/delete" })
	public String delete(int no, int pageNo) {

		saleService.deleteNotice(no);

		return String.format("redirect:list?pageNo=%d", pageNo);
	}

	////////////////////////////////////////////////////////////////////////
	List<SaleImageVO> parseAndSaveUploadImages(MultipartHttpServletRequest req) {

		ArrayList<SaleImageVO> imageFiles = new ArrayList<>();

		if (!ObjectUtils.isEmpty(req)) {
			String dirpath = req.getServletContext().getRealPath("/upload-images/");

			System.out.println(dirpath);

			Iterator<String> iter = req.getFileNames();
			while (iter.hasNext()) { // 다음항목이 있는지 확인
				String name = iter.next(); // 다음 항목 반환
				List<MultipartFile> files = req.getFiles(name);// 파일들의 이름을 리스트꼴로 여러가지 담음

				for (MultipartFile file : files) {
					String originalImageName = file.getOriginalFilename();
					if (originalImageName == null || originalImageName.length() == 0) {
						continue;
					}

					String uniqueFileName = Util.makeUniqueFileName(originalImageName);

					try {

						// 파일을 Disk에 저장
						file.transferTo(new File(dirpath, uniqueFileName));

						String thumbnailName = Util.createThumbnail(dirpath, uniqueFileName, 256);
						
						// 파일정보를 VO에 저장하고 목록에 추가 ( -> DB에 저장)
						SaleImageVO images = new SaleImageVO();
						images.setOriginalName(originalImageName);
						images.setSavedName(uniqueFileName);
						// thumbnail image 만들고 저장
						images.setThumbImage(thumbnailName);

						imageFiles.add(images);

					} catch (Exception e) {

						e.printStackTrace();
					}

				}
			}
		}

		return imageFiles;

	}

}
