package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.company.domain.CustomerDTO;
import com.company.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserServcie {

	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public boolean register(CustomerDTO customerDto) {
		customerDto.setPassword(passwordEncoder.encode(customerDto.getPassword()));
		boolean result = mapper.register(customerDto)==1 ;
		mapper.register_auth(customerDto.getUserid(), "ROLE_ADMIN");
		//mapper.register_auth(customerDto.getUserid(), "ROLE_USER");
		return result;
	}


	

}
