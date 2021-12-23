package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.company.domain.ItemDTO;
import com.company.domain.sellItemDTO;
import com.company.service.StockService;

@Controller
public class StockController {
	
	@Autowired
	public StockService service;
	
	@GetMapping("/tables-2")
	public void list(Model model) {

		List<sellItemDTO> list = service.sellAll();

		model.addAttribute("list", list);
	}
}
