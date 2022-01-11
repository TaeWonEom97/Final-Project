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



import com.company.domain.PutInDTO;
import com.company.mapper.PutInMapper;
import com.company.service.PutInService;

import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j2
public class PutInController {

	@Autowired
	private PutInService service;

	@GetMapping("/putin")
	public void select(Date insertdate, Model model) {
	}

//	@GetMapping("/{code}")
//	public void select(PutInDTO updateDto) {
//	}

	@PostMapping("/putin")
	public ResponseEntity<List<PutInDTO>> getRow(String insertDate, Model model) {
		log.info("날짜" + insertDate);

		List<PutInDTO> dto = service.getRow(insertDate);

		return new ResponseEntity<List<PutInDTO>>(dto, HttpStatus.OK);
	}

	@PostMapping("/putinnew")
	public ResponseEntity<String> create(@RequestBody PutInDTO newPutinDto) {
		log.info("신규 등록" + newPutinDto);

		return service.insertNew(newPutinDto) ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}

	@PostMapping("/putin/{seqid}")
	public ResponseEntity<String> modify(@RequestBody PutInDTO updateDto) {
		log.info("내역 수정 " + updateDto);

		return service.update(updateDto) ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}

	@DeleteMapping("/putin/{code}")
	public ResponseEntity<String> delete(@PathVariable String code) {
		log.info("내역 삭제 " + code);
		
		return service.putinRemove(code) ?
				new ResponseEntity<String>("success", HttpStatus.OK):
					new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	

    }
	
}
	
	
	

