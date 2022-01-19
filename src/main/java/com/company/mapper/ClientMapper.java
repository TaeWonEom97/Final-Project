package com.company.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.company.domain.ClientDTO;

public interface ClientMapper {
	public List<ClientDTO> select();
	public int insert(ClientDTO clientDto);
	public ClientDTO clickSelect(String clcode);
	public int update(ClientDTO updateDto);
	public int remove(String clcode);
	
}
