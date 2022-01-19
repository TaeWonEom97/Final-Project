package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.domain.ClientDTO;
import com.company.domain.ItemDTO;
import com.company.domain.PutInDTO;
import com.company.domain.SellItemDTO;
import com.company.mapper.PutInMapper;
import com.company.service.ClientService;
import com.company.service.PutInService;

import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j2
public class ClientController {

	@Autowired
	private ClientService service;

	@GetMapping("/client")
	public void StockListGet(Model model) {
		log.info("재고현황 폼 요청");
		List<ClientDTO> list = service.getRow();

		model.addAttribute("list", list);

	}
	
	@PostMapping("/client/insertClient")
	   public ResponseEntity<String> insertSell(@RequestBody ClientDTO clientDto) {
	      log.info("판매 등록 " + clientDto);
	      
	      return service.insert(clientDto)?
	            new ResponseEntity<String>("success", HttpStatus.OK):
	               new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	   }

	@PostMapping("/client/{clcode}")
	   public ResponseEntity<ClientDTO> read(@PathVariable String clcode) {
	      log.info("하나 가져오기 " + clcode);
	      
	      return new ResponseEntity<ClientDTO>(service.clickSelect(clcode), HttpStatus.OK);
	   }
	   
	   @DeleteMapping("/client/{clcode}")
	   public ResponseEntity<String> remove(@PathVariable String clcode) {
	      log.info("내역 삭제 " + clcode);
	      
	      return service.clientRemove(clcode)?
	            new ResponseEntity<String>("success", HttpStatus.OK):
	               new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	   }
	
	   @PutMapping("/client/{clcode}")
	   public ResponseEntity<String> modify(@RequestBody ClientDTO clientDto) {
	      log.info("내역 수정 " + clientDto);
	      
	      return service.update(clientDto)?
	            new ResponseEntity<String>("success", HttpStatus.OK):
	               new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	   }



	
}
	
	
	

