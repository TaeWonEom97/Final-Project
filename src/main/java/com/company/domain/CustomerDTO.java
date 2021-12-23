package com.company.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CustomerDTO {
	private String userid;
	private String password;
	private String confirm_password;
	private String company;
	private boolean enabled;
	
	private List<AuthDTO> authList;
}
