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
public class CustomerDTO {
	private String userid;
	private String password;
	private String company;
	private boolean enabled;
	private AuthDTO authDto;
	

	private List<AuthDTO> authList;
	
}
