package com.company.service;

import java.util.List;

import com.company.domain.AuthDTO;
import com.company.domain.ChangePwdDTO;
import com.company.domain.CustomerDTO;

public interface UserService {
	public boolean register(CustomerDTO customerDto);
	public boolean forgotPwd(String userid, String password);
	public CustomerDTO searchId(CustomerDTO customerDto);
	public boolean changePwd(ChangePwdDTO changeDto);
	public CustomerDTO checkId(String userid);
	public List<CustomerDTO> adminRead();
	public List<AuthDTO> authRead(String userid);
}
