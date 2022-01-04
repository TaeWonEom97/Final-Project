package com.company.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.domain.ItemDTO;

@Controller
public class MainController {

	
   

    @GetMapping("/excel/download")
    public void excelDownload(HttpServletResponse response, ItemDTO itemDTO) throws IOException {
//        Workbook wb = new HSSFWorkbook();
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("stock list1");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("번호");
        cell = row.createCell(1);
        cell.setCellValue("매장명");
        cell = row.createCell(2);
        cell.setCellValue("제조사");
        cell = row.createCell(3);
        cell.setCellValue("상품명");
        cell = row.createCell(4);
        cell.setCellValue("사이즈");
        cell = row.createCell(5);
        cell.setCellValue("판매수량");
        cell = row.createCell(6);
        cell.setCellValue("현재재고수량");
        cell = row.createCell(7);
        cell.setCellValue("판매일");
        cell = row.createCell(8);
        cell.setCellValue("총판매금액");

        // Body
        for (int i=0; i<10; i++) {
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(i);
            cell = row.createCell(1);
            cell.setCellValue(itemDTO.getItemtitle());
            cell = row.createCell(2);
            cell.setCellValue(i+"_title");
            cell = row.createCell(3);
            cell.setCellValue(i);
            cell = row.createCell(4);
            cell.setCellValue(i+"_name");
            cell = row.createCell(5);
            cell.setCellValue(i+"_title");
            cell = row.createCell(6);
            cell.setCellValue(i);
            cell = row.createCell(7);
            cell.setCellValue(i+"_name");
            cell = row.createCell(8);
            cell.setCellValue(i+"_title");
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }
}
