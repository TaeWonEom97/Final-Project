package com.company.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.company.domain.PutInDTO;
import com.company.service.PutInServiceImpl;

@Controller
public class MainController3 {
	
	@Autowired
	PutInServiceImpl service;

    @GetMapping("/excel/download3")
    public void excelDownload(HttpServletResponse response) throws IOException {
    	
    	List<PutInDTO> list = service.getRow2();
    	
//        Workbook wb = new HSSFWorkbook();
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("insert itemlist");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("제품코드");
        cell = row.createCell(1);
        cell.setCellValue("입고수량");
        cell = row.createCell(2);
        cell.setCellValue("입고날짜");
        cell = row.createCell(3);
        cell.setCellValue("입고순번");
        cell = row.createCell(4);
        cell.setCellValue("제품명");
        cell = row.createCell(5);
        cell.setCellValue("제품가격");
        cell = row.createCell(6);
        cell.setCellValue("공급처");
        cell = row.createCell(7);
        cell.setCellValue("사이즈");
        cell = row.createCell(8);
        cell.setCellValue("색상");

        // Body
        for (PutInDTO dto : list) {
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(dto.getCode());
            cell = row.createCell(1);
            cell.setCellValue(dto.getInsertnum());
            cell = row.createCell(2);
            cell.setCellValue(dto.getInsertdate());
            cell = row.createCell(3);
            cell.setCellValue(dto.getSeqid());
            cell = row.createCell(4);
            cell.setCellValue(dto.getItemtitle());
            cell = row.createCell(5);
            cell.setCellValue(dto.getItemprice());
            cell = row.createCell(6);
            cell.setCellValue(dto.getSupplier());
            cell = row.createCell(7);
            cell.setCellValue(dto.getItemsize());
            cell = row.createCell(8);
            cell.setCellValue(dto.getColor());
        }

        // 컨텐츠 타입과 파일명 지정
        String fileName = "입고 리스트.xlsx";
		String outputFileName = new String(fileName.getBytes("KSC5601"), "8859_1");
        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=입고 리스트.xls");
        response.setHeader("Content-Disposition", "attachment;filename=입고 리스트.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }
}