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

import com.company.domain.SellItemDTO;
import com.company.service.StockService;

import lombok.Setter;

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
	


	@GetMapping(value = "outcomeList")
	public @ResponseBody List<SellItemDTO> outcomeList(Locale locale, Model model) {


		List<SellItemDTO> list = stockService.sellAll();

		return list;
	}
	
}
