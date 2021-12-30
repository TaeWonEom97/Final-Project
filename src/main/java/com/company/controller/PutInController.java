package com.company.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.company.domain.ItemDTO;
import com.company.domain.PutInDTO;
import com.company.domain.ReplyDTO;
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
	
	@GetMapping("/putin2")
	public void insertNew(PutInDTO insertnewDto) {
	}
	
	// @PreAuthorize("isAuthenticaed()")
	@PostMapping("/putin2")
	public ResponseEntity<String> create(@RequestBody PutInDTO newPutinDto){
		log.info("신규 등록"+newPutinDto);
		
		return service.insertNew(newPutinDto)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}
	

//	@PreAuthorize("isAuthenticaed()")
//	@PostMapping("/new")
//	public ResponseEntity<String> create(@RequestBody ReplyDTO insertDto){
//		log.info("댓글 입력 "+insertDto);
//		
//		return service.insertReply(insertDto)?
//				new ResponseEntity<String>("success",HttpStatus.OK):
//					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
//	}
	
	
	
//	@PostMapping("/new")
//	public ResponseEntity<String> create(@RequestBody ReplyDTO insertDto){
//		log.info("댓글 입력 "+insertDto);
//		
//		return service.insertReply(insertDto)?
//				new ResponseEntity<String>("success",HttpStatus.OK):
//					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
//	}
	
//	
//	@PostMapping("/putin")
//	public String updatePost(PutInDTO putinDto) {
//		log.info("DTO 가져오기"+putinDto);
//		
//		service.update(putinDto);
//		
//		return "/putin";
//	}
	
	
}
