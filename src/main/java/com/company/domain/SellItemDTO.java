package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class SellItemDTO {
	private String sellid;
	private int sellnum;
	private String selldate;
	private String sellcode;
	private String selluser;

	private ItemDTO itemDto;
	private CustomerDTO customerDto;

}
