package com.company.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.company.domain.ItemDTO;
import com.company.domain.SellItemDTO;
import com.company.service.ItemService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ItemController {

	@Autowired
	private ItemService service;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/item")
	public void list(Model model) {
		log.info("아이템 조회");

		List<ItemDTO> list = service.itemAll();

		model.addAttribute("list", list);
	}

	@PostMapping("/insertItem")
	public ResponseEntity<String> insertItem(@RequestBody ItemDTO insertDto) {
		log.info("등록 " + insertDto);

		return service.itemInsert(insertDto) ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}

	@GetMapping("/item/{itemcode}")
	public ResponseEntity<ItemDTO> read(@PathVariable String itemcode) {
		log.info("하나 가져오기 " + itemcode);

		return new ResponseEntity<ItemDTO>(service.itemget(itemcode), HttpStatus.OK);
	}

	@DeleteMapping("/item/{itemcode}")
	public ResponseEntity<String> delete(@PathVariable String itemcode) {
		log.info("내역 삭제 " + itemcode);

		return service.itemRemove(itemcode) ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}

	@PutMapping("/item/{itemcode}")
	public ResponseEntity<String> modify(@RequestBody ItemDTO updatedto) {
		log.info("내역 수정 " + updatedto);

		return service.itemUpdate(updatedto) ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	@ResponseBody
	@PostMapping("/excelUp")
    public String writeMassiveArticle(MultipartHttpServletRequest request){
        
        MultipartFile excelFile = request.getFile("excelFile");
        if(excelFile==null || excelFile.isEmpty()){
            throw new RuntimeException("엑셀파일을 선택해 주세요");
        }
 
        File destFile = new File("C:\\test\\"+excelFile.getOriginalFilename());
        try {
            excelFile.transferTo(destFile);
        } catch (IllegalStateException | IOException e) {
            throw new RuntimeException(e.getMessage(),e);
 
        }
        
        service.upload(destFile);
        
        destFile.delete();
        
        return "redirect:/item";
    }

}
