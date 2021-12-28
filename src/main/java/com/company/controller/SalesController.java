package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.SalesListDTO;
import com.company.service.SalesService;


@Controller
public class SalesController {
	
	@Autowired
	public SalesService service;
	
	@GetMapping("/salesList")
	public void list(Model model) {
		
		List<SalesListDTO> list = service.getList();
		
		model.addAttribute("list",list);
	}
	
	
	
	
	
}
