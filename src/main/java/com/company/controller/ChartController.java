package com.company.controller;

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
import com.company.domain.SellItemDTO;
import com.company.service.StockService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class ChartController {
	
	@Autowired
	private StockService stockService;

	@RequestMapping(value = "chartex1", method = RequestMethod.GET)
	public void dateIncome(Locale locale, Model model) {

	}

	@GetMapping(value = "incomeList")
	public @ResponseBody List<SellItemDTO> incomeList(Locale locale, Model model) {


		List<SellItemDTO> list = stockService.sellAll();

		return list;
	}
	

	 	@RequestMapping(value = "/chartex", method = RequestMethod.GET)
	 	public void dataOutcome(Locale locale, Model model) {

	 		
	 	}
	 	
	 	
	 	@GetMapping(value = "OutcomeList")
		public @ResponseBody List<ChartDTO> OutcomeList(Locale locale, Model model) {
	 		List<ChartDTO> sellnum = stockService.sellnum();
	 		
	 		log.info("월별차트"+sellnum);
	  
	  		return sellnum;
		}
	
	
}
