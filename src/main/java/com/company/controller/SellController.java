package com.company.controller;

import java.util.List;

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
   
   @PostMapping("/insertSell")
   public ResponseEntity<String> insertSell(@RequestBody SellItemDTO insertDto) {
      log.info("판매 등록 " + insertDto);
      
      return service.sellInsert(insertDto)?
            new ResponseEntity<String>("success", HttpStatus.OK):
               new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
   }
   
   @PostMapping("/{sellid}")
   public ResponseEntity<SellItemDTO> read(@PathVariable String sellid) {
      log.info("하나 가져오기 " + sellid);
      
      return new ResponseEntity<SellItemDTO>(service.sellGet(sellid), HttpStatus.OK);
   }
   
   @DeleteMapping("/{sellid}")
   public ResponseEntity<String> remove(@PathVariable String sellid) {
      log.info("내역 삭제 " + sellid);
      
      return service.sellRemove(sellid)?
            new ResponseEntity<String>("success", HttpStatus.OK):
               new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
   }
   
   @PutMapping("/{sellid}")
   public ResponseEntity<String> modify(@RequestBody SellItemDTO updateDto) {
      log.info("내역 수정 " + updateDto);
      
      return service.sellUpdate(updateDto)?
            new ResponseEntity<String>("success", HttpStatus.OK):
               new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
   }



   @GetMapping("/tables-3")//판매내역조회
   public void table3Get() {
      log.info("폼 요청");
      
      
   }

}
