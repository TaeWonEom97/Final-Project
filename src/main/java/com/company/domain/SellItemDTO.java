package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SellItemDTO {
	private String sellcode;
	private int sellnum;
	private String selldate;
	private String sellid;
	private String selluser;
	
	private ItemDTO itemDto;
	private CustomerDTO customerDto;
	
}
