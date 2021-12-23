package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemDTO {
	private String itemcode;
	private String itemtitle;
	private int itemprice;
	private String supplier;
	private String itemsize;
	private String color;
}
