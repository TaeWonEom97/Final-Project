package com.company.service;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.company.domain.AuthDTO;
import com.company.domain.ChangePwdDTO;
import com.company.domain.CustomerDTO;
import com.company.mapper.UserMapper;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public boolean register(CustomerDTO customerDto) {
		customerDto.setPassword(passwordEncoder.encode(customerDto.getPassword()));

		boolean result = mapper.register(customerDto)==1 ;
		// mapper.register_auth(customerDto.getUserid(), "ROLE_ADMIN");

		mapper.register_auth(customerDto.getUserid(), "ROLE_USER");
		return result;
	}

	@Override
	public boolean forgotPwd(String userid, String password) {
		String pwd = passwordEncoder.encode(password);
		return mapper.forgotPwd(userid, pwd) > 0 ? true : false;
	}

	@Override
	public CustomerDTO searchId(CustomerDTO customerDto) {
		return mapper.searchId(customerDto);
	}

	@Override
	public boolean changePwd(ChangePwdDTO changeDto) {

		CustomerDTO customerDto = mapper.read(changeDto.getUserid());

		log.info(customerDto);

		boolean matches = passwordEncoder.matches(changeDto.getPassword(), customerDto.getPassword());

		log.info(changeDto.getPassword() + " --비교-- " + customerDto.getPassword());

		if (matches) {
			changeDto.setPassword(customerDto.getPassword());
			changeDto.setNew_password(passwordEncoder.encode(changeDto.getNew_password()));
			return mapper.changePwd(changeDto) > 0 ? true : false;
		} else {
			return false;
		}
	}

	@Override
	public CustomerDTO checkId(String userid) {
		return mapper.checkId(userid);
	}

	@Override
	public List<CustomerDTO> adminRead() {
		return mapper.adminRead();
	}

	@Override
	public boolean adminUpdate(String userid) {
		return mapper.adminUpdate(userid) > 0 ? true : false;
	}

	public List<AuthDTO> authRead(String userid) {
		return mapper.authRead(userid);
	}

	
}
