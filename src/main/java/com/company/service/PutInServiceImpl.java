package com.company.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.company.domain.PutInDTO;
import com.company.mapper.PutInMapper;

import lombok.extern.log4j.Log4j2;
import utilities.excel.ExcelRead;
import utilities.excel.ReadOption;

@Service
public class PutInServiceImpl implements PutInService {
	
	@Autowired
	private PutInMapper mapper;

	@Override
	public List<PutInDTO> getRow(String insertdate) {
		return mapper.select(insertdate);
	}

	@Override
	public boolean insertNew(PutInDTO insertnewDto) {
		return mapper.insert(insertnewDto) > 0? true:false;
	}

	@Override
	public PutInDTO get(String code) {
		return mapper.get(code);
	}

	public List<PutInDTO> getRow2() {
		return mapper.select2();
	}

	@Override
	public boolean update(PutInDTO updateDto) {
		return mapper.update(updateDto) > 0 ? true : false;
	}

	@Override
	public boolean putinRemove(String code) {
		return mapper.remove(code) > 0 ? true:false;
	}

}
