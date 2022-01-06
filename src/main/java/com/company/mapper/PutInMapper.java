package com.company.mapper;

import java.util.Date;
import java.util.List;

import com.company.domain.PutInDTO;

public interface PutInMapper {
	public List<PutInDTO> select(String insertDate);
	public List<PutInDTO> select2();
	public int insert(PutInDTO insertNewDto);
	
}
