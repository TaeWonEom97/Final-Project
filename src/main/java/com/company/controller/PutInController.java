package com.company.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.company.domain.ItemDTO;
import com.company.domain.PutInDTO;
import com.company.domain.ReplyDTO;
import com.company.domain.SellItemDTO;
import com.company.service.PutInService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class PutInController {
	
	@Autowired
	private PutInService service;	

	@GetMapping("/putin")
	public void select(Date insertdate,Model model) {
	}

	@PostMapping("/putin")
	public ResponseEntity<List<PutInDTO>> getRow(String insertDate,Model model) {
		log.info("날짜"+insertDate);
		
		List<PutInDTO> dto = service.getRow(insertDate);
		
		return new ResponseEntity<List<PutInDTO>>(dto,HttpStatus.OK);
	}

	@PostMapping("/putinnew")
	public ResponseEntity<String> create(@RequestBody PutInDTO newPutinDto){
		log.info("신규 등록"+newPutinDto);
		
		return service.insertNew(newPutinDto)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}
	
	

	@PostMapping("/{code}")
	public ResponseEntity<PutInDTO> read(@PathVariable String code) {
		log.info("하나 가져오기 " + code);
		
		return new ResponseEntity<PutInDTO>(service.get(code), HttpStatus.OK);
	}
	
	@DeleteMapping("/{code}")
	public ResponseEntity<String> remove(@PathVariable String code) {
		log.info("내역 삭제 " + code);
		
		return service.remove(code)?
				new ResponseEntity<String>("success", HttpStatus.OK):
					new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	@PutMapping("/{code}")
	public ResponseEntity<String> modify(@RequestBody PutInDTO updateDto) {
		log.info("내역 수정 " + updateDto);
		
		return service.update(updateDto)?
				new ResponseEntity<String>("success", HttpStatus.OK):
					new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	
}
