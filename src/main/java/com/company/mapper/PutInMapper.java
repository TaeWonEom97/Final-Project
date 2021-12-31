package com.company.mapper;

import java.util.Date;
import java.util.List;

import com.company.domain.PutInDTO;

public interface PutInMapper {
	public List<PutInDTO> select(String insertDate);
	public int insert(PutInDTO insertNewDto);
	public PutInDTO get(String code);
	public int remove(String code);
	public int update(PutInDTO updateDto);
}
