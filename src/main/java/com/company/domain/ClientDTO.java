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

public class ClientDTO {
	
	private String clcode;
	private String clname;
	private String clregnum;
	private String clrepre;
	private String clcellnum;
	private String clemp;
	
	
//	private List<ClientDTO> clDto;
//	private List<ItemDTO> itemDto;
	
}
