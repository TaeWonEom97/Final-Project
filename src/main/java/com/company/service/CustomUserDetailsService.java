package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


import com.company.domain.CustomerUser;
import com.company.domain.CustomerDTO;
import com.company.mapper.UserMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		log.info("userid : "+userid);
		CustomerDTO customer = mapper.read(userid);
		log.info("인증 정보"+customer);
		
		
		return new CustomerUser(customer);
	}

}