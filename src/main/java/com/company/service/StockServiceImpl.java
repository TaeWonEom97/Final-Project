package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.ItemDTO;
import com.company.domain.SellItemDTO;
import com.company.domain.StockDTO;
import com.company.mapper.StockMapper;

@Transactional
@Service
public class StockServiceImpl implements StockService {
	@Autowired
	private StockMapper mapper;
	
	@Override
	public List<ItemDTO> stockDto() {
	
		return mapper.stocklist();
	}

	@Override
	public List<SellItemDTO> sellAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean stocknum(StockDTO stockDto) {
		return mapper.Stocknum(stockDto)> 0? true : false ;
	}

}











