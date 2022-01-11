package com.company.mapper;

import java.util.List;
import com.company.domain.ChartDTO;
import com.company.domain.PutInDTO;
import com.company.domain.SellItemDTO;


import org.apache.ibatis.annotations.Mapper;

import com.company.domain.ItemDTO;
import com.company.domain.StockDTO;


public interface StockMapper {
	//public int insert(ItemDTO insertDto); 

	public String insert1(StockDTO insertDto); 
	public int Stocknum(StockDTO insertDto);			 
	public List<ItemDTO> stocklist();
	public List<ItemDTO> stockcate();
	public List<ItemDTO> stockchart();
}
