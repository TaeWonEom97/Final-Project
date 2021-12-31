package com.company.controller;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.domain.ChartDTO;
import com.company.domain.PutInDTO;
import com.company.domain.SellItemDTO;
import com.company.service.PutInService;
import com.company.service.StockService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class ChartController {
	
	@Autowired
	private StockService stockService;
	@Autowired
	private PutInService putinService;


	@GetMapping(value = "incomeList")
	public @ResponseBody List<SellItemDTO> incomeList(Locale locale, Model model) {
		List<SellItemDTO> list = stockService.sellAll();
		return list;
	}
		 	
	@GetMapping(value = "OutcomeList")
	public @ResponseBody List<ChartDTO> OutcomeList(Locale locale, Model model) {
	 	List<ChartDTO> sellnum = stockService.sellnum();	 		
	 	log.info("월별차트"+sellnum);	 
	  	return sellnum;
	}
	
	@GetMapping(value = "insertList")
	public @ResponseBody List<PutInDTO> insertList(Locale locale, Model model) {
	 	List<PutInDTO> insertnum = putinService.getRow2();	 		
	 	log.info("월별차트"+insertnum);	 
	  	return insertnum;
	}
	
	@GetMapping(value = "insertbarList")
	public @ResponseBody List<PutInDTO> insertbarList(Locale locale, Model model) {
	 	List<PutInDTO> insertnum = stockService.insertnum();	 		
	 	log.info("월별차트"+insertnum);	 
	  	return insertnum;
	}
	
}
