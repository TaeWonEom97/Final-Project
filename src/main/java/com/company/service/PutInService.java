package com.company.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.company.domain.PutInDTO;
import com.company.domain.SellItemDTO;

public interface PutInService {
	public List<PutInDTO> getRow(String insertdate);
	public boolean insertNew(PutInDTO insertnewDto);
	public PutInDTO get(String code);
	public boolean update(PutInDTO updateDto);
	public boolean putinRemove(String code);

}
