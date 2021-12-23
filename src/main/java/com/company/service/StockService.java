package com.company.service;

import java.util.List;

import com.company.domain.ItemDTO;
import com.company.domain.SellItemDTO;

public interface StockService {
	public List<SellItemDTO> sellAll();
}
