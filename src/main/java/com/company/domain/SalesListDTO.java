package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SalesListDTO {
	private String sellcode;
	private int sellnum;
	private String selldate;
	private String sellid;

	private ItemDTO itemDto;

	public SalesListDTO(ItemDTO itemDto) {
		super();
		this.itemDto = itemDto;
	}

}
