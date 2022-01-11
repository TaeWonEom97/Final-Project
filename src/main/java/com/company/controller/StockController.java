package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.company.domain.ItemDTO;
import com.company.service.StockService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class StockController {

	@Autowired
	private StockService service;

	// /tables-4 =StockList.jsp
	@GetMapping("/tables-4")
	public void StockListGet(Model model, ItemDTO itemDto) {
		log.info("재고현황 폼 요청");
		List<ItemDTO> list = service.stockDto();

		model.addAttribute("list", list);

	}

//	@GetMapping("/getSearchList")
//	@ResponseBody
//	private List<StockDTO> getSearchList(@RequestParam)
//	@PostMapping("/StockList")
//	public String StockId(BoardDTO insertDto) {
//		log.info("StockList 가져오기 "+insertDto);
//		
//	}
}
