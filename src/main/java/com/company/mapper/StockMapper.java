package com.company.mapper;

import java.util.List;

import com.company.domain.SellItemDTO;

public interface StockMapper {
	public List<SellItemDTO> sellList();
	public int sellInsert(SellItemDTO insertDto);
	public SellItemDTO sellGet(String sellid);
	public int remove(String sellid);
	public int update(SellItemDTO updateDto);
}
