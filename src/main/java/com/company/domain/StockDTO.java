package com.company.domain;

import com.company.service.SellService;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class StockDTO  {
private String stockcode;
private int stocknum;
private int stockid;

//검색필터
private String type;
private String writer;
}

