package com.company.mapper;

import java.util.List;

import com.company.domain.ChartDTO;
import com.company.domain.SellItemDTO;

public interface StockMapper {
	public List<SellItemDTO> sellList();
	public List<ChartDTO> sellchart();
}
