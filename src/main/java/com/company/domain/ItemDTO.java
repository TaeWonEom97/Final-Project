package com.company.domain;

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
public class ItemDTO {
	private String itemcode;
	private String itemtitle;
	private int itemprice;
	private String supplier;
	private String itemsize;
	private String color;
	
	private int stock;
	
	private SellItemDTO sellItemDto;
	private InsertItemDTO insertItemDto;
}
