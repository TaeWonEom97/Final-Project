package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.SellItemDTO;
import com.company.domain.StockDTO;
import com.company.mapper.StockMapper;

@Transactional
@Service
public class StockServiceImpl implements StockService {
	@Autowired
	private StockMapper<StockDTO> mapper;
	
	@Override
	public List<StockDTO> stockDto() {
	
		return mapper.stocklist();
	}

	@Override

	public List<SellItemDTO> sellAll1() {
		
		return null;
	}

	@Override
	public List<SellItemDTO> sellAll() {
		// TODO Auto-generated method stub
		return null;
	}
}











