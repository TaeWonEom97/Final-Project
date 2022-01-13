package com.company.domain;

import java.util.Date;
import java.util.List;
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

public class PutInDTO {
	private String code;
	private int insertnum;
	private Date insertdate;
	private int seqid;
	private String itemcode;
	private String itemtitle;
	private int itemprice;
	private String supplier;
	private String itemsize;
	private String color;
	
	private List<ItemDTO> itemDto;
	private CustomerDTO customerDto;
}
