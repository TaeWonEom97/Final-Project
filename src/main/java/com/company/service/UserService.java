package com.company.service;

import com.company.domain.ChangePwdDTO;
import com.company.domain.CustomerDTO;

public interface UserService {
	public boolean register(CustomerDTO customerDto);
	public boolean forgotPwd(String userid, String password);
	public CustomerDTO searchId(CustomerDTO customerDto);
	public boolean changePwd(ChangePwdDTO changeDto);
}
