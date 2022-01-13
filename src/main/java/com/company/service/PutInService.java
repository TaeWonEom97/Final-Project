package com.company.service;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.multipart.MultipartFile;

import com.company.domain.ItemDTO;
import com.company.domain.PutInDTO;

public interface PutInService {
	public List<PutInDTO> getRow(String insertdate);
	public boolean insertNew(PutInDTO insertnewDto);
	public PutInDTO get(String code);
	public boolean update(PutInDTO updateDto);
	public boolean putinRemove(String code);
	
//	public List<PutInDTO> putinDto();
	
	public List<PutInDTO> getRow2();


}
