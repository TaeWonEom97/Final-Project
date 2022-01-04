package com.company.mapper;

import java.util.List;

import com.company.domain.ChartDTO;
import com.company.domain.PutInDTO;
import com.company.domain.SellItemDTO;

public interface SellMapper {
		public List<SellItemDTO> sellList();
		public List<ChartDTO> sellchart();
		public List<PutInDTO> insertchart();
		public int sellInsert(SellItemDTO insertDto);
		public SellItemDTO sellGet(String sellid);
		public int remove(String sellid);
		public int update(SellItemDTO updateDto);
}

