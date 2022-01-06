package com.company.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.domain.ItemDTO;
import com.company.service.StockServiceImpl;

@Controller
public class MainController {
	
	@Autowired
	StockServiceImpl service;
   

    @GetMapping("/excel/download")
    public void excelDownload(HttpServletResponse response) throws IOException {
    	
    	List<ItemDTO> list = service.stockDto();
    			
    	
    	
    	
    	
//        Workbook wb = new HSSFWorkbook();
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("stock list1");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        // 컬럼
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("코드번호");
        cell = row.createCell(1);
        cell.setCellValue("제조사");
        cell = row.createCell(2);
        cell.setCellValue("상품명");
        cell = row.createCell(3);
        cell.setCellValue("사이즈");
        cell = row.createCell(4);
        cell.setCellValue("색상");
        cell = row.createCell(5);
        cell.setCellValue("가격");
        cell = row.createCell(6);
        cell.setCellValue("현재재고수량");
        
        // 실제 받을 내용
        for(ItemDTO dto:list) {
        	row = sheet.createRow(rowNum++);
        	cell = row.createCell(0);
        	cell.setCellValue(dto.getItemcode()); // 여기는 번호 들어가는 곳인거 같은데 형님테이블에 번호를 안받았으니 그냥 변수하나 사용해서  i++ 이런식으로 늘려서 넣거요
        	cell = row.createCell(1);
        	cell.setCellValue(dto.getSupplier()); //cell.setCellValue("매장명"); 매장명 들어있는 테이블 하나 불러서 넣고!
        	cell = row.createCell(2);
        	cell.setCellValue(dto.getItemtitle());
        	cell = row.createCell(3); 
        	cell.setCellValue(dto.getItemsize());
        	cell = row.createCell(4); 
        	cell.setCellValue(dto.getColor());
        	cell = row.createCell(5); 
        	cell.setCellValue(dto.getItemprice()); 
        	cell = row.createCell(6);
        	cell.setCellValue(dto.getStock());
        	
        }
        	
        

        // 컨텐츠 타입과 파일명 지정
        String fileName = "재고리스트.xlsx";
        String outputFileName = new String(fileName.getBytes("KSC5601"), "8859_1");
        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=재고리스트.xls");
        response.setHeader("Content-Disposition", "attachment;filename=" + outputFileName + "");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }
}
