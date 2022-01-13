package com.company.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.company.domain.ItemDTO;
import com.company.domain.SellItemDTO;
import com.company.service.SellService;

import com.company.service.StockService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class SellController {
   
   @Autowired
   private SellService service;
   
   @GetMapping("/sellPage")
   public void list(Model model) {
      
      log.info("판매 조회");
      
      List<SellItemDTO> list = service.sellAll();

      model.addAttribute("list", list);
   }
   
   @PostMapping("/sell/insertSell")
   public ResponseEntity<String> insertSell(@RequestBody SellItemDTO insertDto) {
      log.info("판매 등록 " + insertDto);
      
      return service.sellInsert(insertDto)?
            new ResponseEntity<String>("success", HttpStatus.OK):
               new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
   }
   
   @PostMapping("/sell/{sellid}")
   public ResponseEntity<SellItemDTO> read(@PathVariable String sellid) {
      log.info("하나 가져오기 " + sellid);
      
      return new ResponseEntity<SellItemDTO>(service.sellGet(sellid), HttpStatus.OK);
   }
   
   @DeleteMapping("/sell/{sellid}")
   public ResponseEntity<String> remove(@PathVariable String sellid) {
      log.info("내역 삭제 " + sellid);
      
      return service.sellRemove(sellid)?
            new ResponseEntity<String>("success", HttpStatus.OK):
               new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
   }
   
   @PutMapping("/sell/{sellid}")
   public ResponseEntity<String> modify(@RequestBody SellItemDTO updateDto) {
      log.info("내역 수정 " + updateDto);
      
      return service.sellUpdate(updateDto)?
            new ResponseEntity<String>("success", HttpStatus.OK):
               new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
   }
   
   @GetMapping("/sell/exceldown")
	public void excelDownload(HttpServletResponse response) throws IOException {

	   List<SellItemDTO> list = service.sellAll();

//       Workbook wb = new HSSFWorkbook();
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("sell list1");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;

		// 컬럼
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		cell.setCellValue("상품코드");
		cell = row.createCell(1);
		cell.setCellValue("상품명");
		cell = row.createCell(2);
		cell.setCellValue("사이즈");
		cell = row.createCell(3);
		cell.setCellValue("색상");
		cell = row.createCell(4);
		cell.setCellValue("수량");
		cell = row.createCell(5);
		cell.setCellValue("가격");
		cell = row.createCell(6);
		cell.setCellValue("합계");
		cell = row.createCell(7);
		cell.setCellValue("제조사");
		cell = row.createCell(8);
		cell.setCellValue("판매일");

		// 실제 받을 내용
		for (SellItemDTO dto : list) {
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue(dto.getSellcode()); // 여기는 번호 들어가는 곳인거 같은데 형님테이블에 번호를 안받았으니 그냥 변수하나 사용해서 i++ 이런식으로 늘려서 넣거요
			cell = row.createCell(1);
			cell.setCellValue(dto.getItemDto().getItemtitle()); // cell.setCellValue("매장명"); 매장명 들어있는 테이블 하나 불러서 넣고!
			cell = row.createCell(2);
			cell.setCellValue(dto.getItemDto().getItemsize());
			cell = row.createCell(3);
			cell.setCellValue(dto.getItemDto().getColor());
			cell = row.createCell(4);
			cell.setCellValue(dto.getSellnum());
			cell = row.createCell(5);
			cell.setCellValue(dto.getItemDto().getItemprice());
			cell = row.createCell(6);
			cell.setCellValue(dto.getItemDto().getItemprice()*dto.getSellnum());
			cell = row.createCell(7);
			cell.setCellValue(dto.getItemDto().getSupplier());
			cell = row.createCell(8);
			cell.setCellValue(dto.getSelldate());

		}

		// 컨텐츠 타입과 파일명 지정
		String fileName = "판매리스트.xlsx";
		String outputFileName = new String(fileName.getBytes("KSC5601"), "8859_1");
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=" + outputFileName + "");

		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}

}
