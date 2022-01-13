package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.ItemDTO;
import com.company.mapper.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemMapper mapper;
	
	@Override
	public List<ItemDTO> itemAll() {
		return mapper.itemlist();
	}

	@Override
	public boolean itemInsert(ItemDTO insertDto) {
		return mapper.itemInsert(insertDto) > 0 ? true : false;
	}

	@Override
	public boolean itemRemove(String itemcode) {
		return mapper.remove(itemcode) > 0 ? true : false;
	}

	@Override
	public boolean itemUpdate(ItemDTO updateDto) {
		return mapper.update(updateDto) > 0 ? true : false;
	}

	@Override
	public ItemDTO itemget(String itemcode) {
		return mapper.itemget(itemcode);
	}

	@Override
	public List<ItemDTO> itemDto() {
		return mapper.itemlist();
	}

}
