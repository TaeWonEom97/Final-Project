package com.company.service;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.multipart.MultipartFile;

import com.company.domain.ClientDTO;
import com.company.domain.ItemDTO;
import com.company.domain.PutInDTO;

public interface ClientService {
	public List<ClientDTO> getRow();
	public boolean insert(ClientDTO clientDto);
	public ClientDTO clickSelect(String clcode);
	public boolean update(ClientDTO updateDto);
	public boolean clientRemove(String clcode);

	
	


}
