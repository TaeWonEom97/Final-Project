package com.company.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.ItemDTO;
import com.company.excel.ExcelRead;
import com.company.excel.ReadOption;
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

	@Override
	public void upload(File destFile) {
		ReadOption readOption = new ReadOption();
		readOption.setFilePath(destFile.getAbsolutePath());
		readOption.setOutputColumns("A","B","C","D","E","F");
		readOption.setStartRow(3);
		  
		List<Map<String, String>> excelContent = ExcelRead.read(readOption);
		  
		ItemDTO itemDto = null;
		
		
		for(Map<String, String> article : excelContent){
			
			if(article.get("A") != "") {
				itemDto = new ItemDTO();
				itemDto.setItemcode(article.get("A"));
				itemDto.setItemtitle(article.get("B"));
				int C = Integer.parseInt(article.get("C"));
				itemDto.setItemprice(C);
				itemDto.setSupplier(article.get("D"));
				itemDto.setItemsize(article.get("E"));
				itemDto.setColor(article.get("F"));
				
				this.itemInsert(itemDto);
				
			}
		}
	}


}
