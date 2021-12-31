package com.company.service;

import java.util.List;
import com.company.domain.ChartDTO;
import com.company.domain.PutInDTO;
import com.company.domain.SellItemDTO;

public interface StockService {
	public List<SellItemDTO> sellAll();
	public List<ChartDTO> sellnum();
	public List<PutInDTO> insertnum();
	public boolean sellInsert(SellItemDTO insetDto);
	public SellItemDTO sellGet(String sellid);
	public boolean sellRemove(String sellid);
	public boolean sellUpdate(SellItemDTO updateDto);
}
