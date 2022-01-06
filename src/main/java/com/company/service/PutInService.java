package com.company.service;

import java.util.Date;
import java.util.List;

import com.company.domain.PutInDTO;

public interface PutInService {
	public List<PutInDTO> getRow(String insertdate);
	public boolean insertNew(PutInDTO insertnewDto);
	public List<PutInDTO> getRow2();
}
