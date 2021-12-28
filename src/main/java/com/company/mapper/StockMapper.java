package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.company.domain.StockDTO;


@Mapper
public interface StockMapper<StockDTO> {

	//public int insert(ItemDTO insertDto); 
		
		public String insert1(StockDTO insertDto); 
		public int insert(StockDTO insertDto);			 
		public List<StockDTO> stocklist();
	 
}

