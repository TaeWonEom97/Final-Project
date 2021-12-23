package com.company.mapper;

import org.apache.ibatis.annotations.Param;

import com.company.domain.CustomerDTO;

public interface UserMapper {
	public int register(CustomerDTO customerDto);
	public int register_auth(@Param("userid") String userid, @Param("auth") String auth);
	public CustomerDTO read(String userid);
}
