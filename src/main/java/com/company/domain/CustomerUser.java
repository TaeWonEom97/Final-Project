package com.company.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomerUser extends User {

	private CustomerDTO customer;
	
	public CustomerUser(String username, String password, Collection<? extends GrantedAuthority> auth) {
		super(username, password, auth);
		// TODO Auto-generated constructor stub
	}
	
	public CustomerUser(CustomerDTO customer) {
		super(customer.getUserid(),customer.getPassword(),customer.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.customer = customer;
		
	}
}
