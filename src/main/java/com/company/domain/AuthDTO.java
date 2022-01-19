package com.company.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class AuthDTO {
	private String userid;
	private String auth;
	
    public boolean isRole(String role) {
    	return auth.equals("ROLE_" + role.toUpperCase());
    }

}