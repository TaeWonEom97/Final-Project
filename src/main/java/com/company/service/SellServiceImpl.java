package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.ChartDTO;
import com.company.domain.PutInDTO;
import com.company.domain.SellItemDTO;
import com.company.mapper.SellMapper;

@Service
public class SellServiceImpl implements SellService {

	@Autowired
	private SellMapper mapper;
	
	@Override
	public List<SellItemDTO> sellAll() {
		return mapper.sellList();
	}



	@Override
	public List<ChartDTO> sellnum() {
		return mapper.sellchart();
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

	@Override
	public List<PutInDTO> insertnum() {
		return mapper.insertchart();
	}
}
