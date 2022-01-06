package com.company.service;

import java.util.List;

import com.company.domain.ItemDTO;
import com.company.domain.SellItemDTO;

public interface ItemService {
	public List<ItemDTO> itemAll();
	public boolean itemInsert(ItemDTO insertDto);
	public ItemDTO itemget(String itemcode);
	public boolean itemRemove(String itemcode);
	public boolean itemUpdate(ItemDTO updateDto);
}
