package com.company.service;

import java.util.List;

import com.company.domain.SellItemDTO;

public interface SellService {
	public List<SellItemDTO> sellAll();
	public boolean sellInsert(SellItemDTO insetDto);
	public SellItemDTO sellGet(String sellid);
	public boolean sellRemove(String sellid);
	public boolean sellUpdate(SellItemDTO updateDto);
}
