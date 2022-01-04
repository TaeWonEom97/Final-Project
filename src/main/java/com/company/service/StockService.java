package com.company.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.company.domain.ItemDTO;
import com.company.domain.SellItemDTO;
import com.company.domain.StockDTO;



public interface StockService {
	public List<ItemDTO> stockDto();
	
	public List<SellItemDTO> sellAll();
	
	public boolean stocknum(StockDTO stockDto);

}




