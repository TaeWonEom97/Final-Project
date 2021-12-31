package com.company.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.PutInDTO;
import com.company.mapper.PutInMapper;

@Service
public class PutInServiceImpl implements PutInService {
	
	@Autowired
	private PutInMapper mapper;

	@Override
	public List<PutInDTO> getRow(String insertdate) {
		return mapper.select(insertdate);
	}

	@Override
	public boolean insertNew(PutInDTO insertnewDto) {
		return mapper.insert(insertnewDto) > 0? true:false;
	}

	@Override
	public List<PutInDTO> getRow2() {
		return mapper.select2();
	}

	

}
