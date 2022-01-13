package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.security.core.userdetails.User;

import com.company.domain.ChangePwdDTO;
import com.company.domain.CustomerDTO;

public interface UserMapper {
	public int register(CustomerDTO customerDto);
	public int register_auth(@Param("userid") String userid, @Param("auth") String auth);
	public CustomerDTO read(String userid);
	public int forgotPwd(@Param("userid") String userid, @Param("password") String password);
	public CustomerDTO searchId(CustomerDTO customerDto);
	public int changePwd(ChangePwdDTO changeDto);
	public CustomerDTO checkId(String userid);
	public List<CustomerDTO> adminRead();
	public int adminUpdate(String userid);
	
	
	
}
