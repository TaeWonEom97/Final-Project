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
import com.company.domain.ItemDTO;
import com.company.domain.PutInDTO;
import com.company.domain.SellItemDTO;
import com.company.service.PutInService;
import com.company.service.SellService;
import com.company.service.StockService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class ChartController {

	@Autowired
	private SellService sellService;

	@Autowired
	private PutInService putinService;

	@Autowired
	private StockService stockService;

	@GetMapping(value = "incomeList")
	public @ResponseBody List<SellItemDTO> incomeList(Locale locale, Model model) {
		List<SellItemDTO> list = sellService.sellAll();
		return list;
	}

	@GetMapping(value = "OutcomeList")
	public @ResponseBody List<ChartDTO> OutcomeList(Locale locale, Model model) {
		List<ChartDTO> sellnum = sellService.sellnum();
		log.info("월별차트" + sellnum);
		return sellnum;
	}

	@GetMapping(value = "insertList")
	public @ResponseBody List<PutInDTO> insertList(Locale locale, Model model) {
		List<PutInDTO> insertnum = putinService.getRow2();
		log.info("일별차트" + insertnum);
		return insertnum;
	}

	@GetMapping(value = "insertbarList")
	public @ResponseBody List<PutInDTO> insertbarList(Locale locale, Model model) {
		List<PutInDTO> insertnum = sellService.insertnum();
		log.info("월별차트" + insertnum);
		return insertnum;
	}

	@GetMapping(value = "allsellList")
	public @ResponseBody List<ItemDTO> allsellList(Locale locale, Model model) {
		List<ItemDTO> allsellnum = stockService.stockcate();
		log.info("재고현황" + allsellnum);
		return allsellnum;
	}

	@GetMapping(value = "allsellbarList")
	public @ResponseBody List<ItemDTO> allsellbarList(Locale locale, Model model) {
		List<ItemDTO> allsellbarnum = stockService.stockchart();
		log.info("월별재고" + allsellbarnum);
		return allsellbarnum;
	}

}
