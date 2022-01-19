package com.company.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.company.service.ItemService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class ExcelController {
	
	@Autowired
	private ItemService service;
	
	@PostMapping("/excelUp")
    public void ExcelUp(HttpServletRequest req, HttpServletResponse rep){
        log.info("@@@@@@@@@@@@@@@ExcelUp START@@@@@@@@@@@@@@@");
 
        Map<String, Object> returnObject = new HashMap<String, Object>();
        
        try { // MultipartHttpServletRequest 생성 
            MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
            Iterator<String> iter = mhsr.getFileNames();
            MultipartFile mfile = null; 
            String fieldName = ""; 
            
            // 값이 나올때까지
            while (iter.hasNext()) { 
                fieldName = iter.next().toString(); // 내용을 가져와서 
                mfile = mhsr.getFile(fieldName); 
                String origName; 
                origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 // 파일명이 없다면 
                
                returnObject.put("params", mhsr.getParameterMap()); 
                
                
                //위치 및 파일
                service.getExcelUpload("C:\\test\\"+origName);
            }
            
            } catch (UnsupportedEncodingException e) { // TODO Auto-generated catch block 
                e.printStackTrace(); 
            }catch (IllegalStateException e) { // TODO Auto-generated catch block 
                e.printStackTrace(); 
            } catch (IOException e) { // TODO Auto-generated catch block 
                e.printStackTrace(); 
            }
 
        
        log.info("@@@@@@@@@@@@@@@ExcelUp END@@@@@@@@@@@@@@@");
        
    }

}
