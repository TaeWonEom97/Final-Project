package com.company.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.StockDTO;
import com.company.service.StockService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class StockController {
	
	@Autowired
	private StockService service;
	
	
	//tables-4 =StockList.jsp
	@GetMapping("/tables-4")
	public void StockListGet(Model model) throws Exception {
		log.info("재고현황 폼 요청");
		List<StockDTO> list = service.stockDto();
		
		model.addAttribute("list",list);
	}

	
		//다른 창으로 이동
	@GetMapping("/tables-1")//입고관리
	public void table1Get() {
		log.info("폼 요청");
		//rttr.addAttribute(rttr)
		
	}
	@GetMapping("/tables-2")//판매관리
	public void table2Get() {
		log.info("폼 요청");
	}
	@GetMapping("/tables-3")//판매내역조회
	public void table3Get() {
		log.info("폼 요청");
		
		
	}
	
	}
	
//	@GetMapping("/getSearchList")
//	@ResponseBody
//	private List<StockDTO> getSearchList(@RequestParam)
//	@PostMapping("/StockList")
//	public String StockId(BoardDTO insertDto) {
//		log.info("StockList 가져오기 "+insertDto);
//		
//	}
	


