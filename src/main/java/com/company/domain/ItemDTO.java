package com.company.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class ItemDTO {
   private String itemcode;
   private String itemtitle;
   private int itemprice;
   private String supplier;
   private String itemsize;
   private String color;
   private Date itemdate;
   private int stock;
   private String goods_cate;
   
   private SellItemDTO sellItemDto;
   private InsertItemDTO insertItemDto;
}