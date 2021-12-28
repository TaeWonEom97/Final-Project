package com.company.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.company.domain.StockDTO;



public interface StockService   {
public List<StockDTO> stockDto() throws Exception;
}