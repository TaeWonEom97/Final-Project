package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.company.domain.ItemDTO;


import com.company.domain.ChartDTO;
import com.company.domain.PutInDTO;
import com.company.domain.SellItemDTO;
import com.company.mapper.StockMapper;

@Service
public class StockServiceImpl implements StockService {

	@Autowired
	private StockMapper mapper;
	
	@Override
	public List<ItemDTO> stockDto() {
		return mapper.stocklist();
	}

	@Override

	public List<ItemDTO> stockcate() {
		return mapper.stockcate();
	}

	@Override
	public List<ItemDTO> stockchart() {
		return mapper.stockchart();
	}

}
