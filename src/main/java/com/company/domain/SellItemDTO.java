package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class SellItemDTO {
	private String sellcode;
	private int sellnum;
	private String selldate;
	private String sellid;
	private String selluser;
	
	private ItemDTO itemDto;
	private CustomerDTO customerDto;
	
}
