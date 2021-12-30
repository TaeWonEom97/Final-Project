package com.company.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
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
	private int selldate;
	private int sellcode;
	private String selluser;
	
	private List<ItemDTO> itemDto;
	private List<CustomerDTO> customerDto;

	

	

}
