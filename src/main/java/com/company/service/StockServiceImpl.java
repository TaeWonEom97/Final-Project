package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.SellItemDTO;
import com.company.mapper.StockMapper;

@Service
public class StockServiceImpl implements StockService {

	@Autowired
	private StockMapper mapper;
	
	@Override
	public List<SellItemDTO> sellAll() {
		return mapper.sellList();
	}

	@Override
	public boolean sellInsert(SellItemDTO insetDto) {
		return mapper.sellInsert(insetDto) > 0 ? true : false;
	}

	@Override
	public SellItemDTO sellGet(String sellid) {
		return mapper.sellGet(sellid);
	}

	@Override
	public boolean sellRemove(String sellid) {
		return mapper.remove(sellid) > 0 ? true : false;
	}

	@Override
	public boolean sellUpdate(SellItemDTO updateDto) {
		return mapper.update(updateDto) > 0 ? true : false;
	}

}
