package com.company.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@AllArgsConstructor
public class ReplyPageDTO {
	private int replycnt;
	private List<ReplyDTO> list;
}
