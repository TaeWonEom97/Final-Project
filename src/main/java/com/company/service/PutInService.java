package com.company.service;

import java.util.Date;
import java.util.List;

import com.company.domain.PutInDTO;
import com.company.domain.SellItemDTO;

public interface PutInService {
	public List<PutInDTO> getRow(String insertdate);
	public boolean insertNew(PutInDTO insertnewDto);
	public PutInDTO get(String code);
	public boolean remove(String code);
	public boolean update(PutInDTO updateDto);
}
