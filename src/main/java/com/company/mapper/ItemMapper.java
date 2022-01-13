package com.company.mapper;

import java.util.List;

import com.company.domain.ItemDTO;

public interface ItemMapper {
	public List<ItemDTO> itemlist();
	public int itemInsert(ItemDTO insertDto);
	public ItemDTO itemget(String itemcode);
	public int remove(String itemcode);
	public int update(ItemDTO updateDto);
	
}
