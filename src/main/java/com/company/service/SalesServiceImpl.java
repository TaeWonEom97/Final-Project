package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.SalesListDTO;
import com.company.mapper.StockMapper;

@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	private StockMapper mapper;

	@Override
	public List<SalesListDTO> getList() {
		
		return mapper.saleslist();
	}

}
