package com.company.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.config.ExcelConfig;
import com.company.domain.ItemDTO;
import com.company.mapper.ItemMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
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
	public List<?> getExcelUpload(String excelFile){
                
        Map<String, Object> map = new HashMap<String, Object>();
        List<?> list = null;
        
        try {
//            Workbook wbs = WorkbookFactory.create(new FileInputStream(excelFile));
            Workbook wbs = ExcelConfig.getWorkbook(excelFile);
            
            Sheet sheet = (Sheet) wbs.getSheetAt(0);
 
            //excel file 두번쨰줄부터 시작
            for (int i = sheet.getFirstRowNum() + 2; i <= sheet.getLastRowNum(); i++) {
                
                
                Row row = sheet.getRow(i);
                
                //map.put("IDCOL", ""+ExcelUtil.cellValue(row.getCell(0)));
                map.put("itemcode", ""+ExcelConfig.cellValue(row.getCell(0)));
                map.put("itemtitle", ""+ExcelConfig.cellValue(row.getCell(1)));
                map.put("itemprice", ""+ExcelConfig.cellValue(row.getCell(2)));
                map.put("supplier", ""+ExcelConfig.cellValue(row.getCell(3)));
                map.put("itemsize", ""+ExcelConfig.cellValue(row.getCell(4)));
                map.put("color", ""+ExcelConfig.cellValue(row.getCell(5)));
                
                //신규삽입
                mapper.excelInsert(map);
                
                log.info("map값 확인 : ", map);
            }
 
            //데이터가져옵니다.
            list = mapper.testDbList(map);
            
        }catch(Exception e){
        }
        
        return list;
        
    }

}
