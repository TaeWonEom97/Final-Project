package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.ClientDTO;
import com.company.mapper.ClientMapper;

@Service
public class ClientServiceImpl implements ClientService {

	@Autowired
	private ClientMapper mapper;

	@Override
	public List<ClientDTO> getRow() {
		// TODO Auto-generated method stub
		return mapper.select();
	}

	@Override
	public boolean insert(ClientDTO clientDto) {
		// TODO Auto-generated method stub
		return mapper.insert(clientDto) > 0 ? true:false;
	}

	@Override
	public ClientDTO clickSelect(String clcode) {
		// TODO Auto-generated method stub
		return mapper.clickSelect(clcode);
	}

	@Override
	public boolean update(ClientDTO updateDto) {
		// TODO Auto-generated method stub
		return mapper.update(updateDto) > 0 ? true:false;
	}

	@Override
	public boolean clientRemove(String clcode) {
		// TODO Auto-generated method stub
		return mapper.remove(clcode) > 0 ? true:false;
	}
	



}
