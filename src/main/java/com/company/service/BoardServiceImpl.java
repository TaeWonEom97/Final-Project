package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.BoardDTO;
import com.company.domain.Criteria;
import com.company.mapper.BoardMapper;
import com.company.mapper.ReplyMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	
	
	@Transactional
	@Override
	public boolean register(BoardDTO insertDto) {
		
		//게시글 등록
		boolean result = mapper.insert(insertDto)>0? true : false;
		
		
		return true;
	}

	//리스트 전체 가져오기
	@Override
	public List<BoardDTO> getList(Criteria cri) {
		return mapper.listAll(cri);
	}

	//글 읽기
	@Override
	public BoardDTO getRow(int bno) {
		return mapper.read(bno);
	}

	//게시글 수정
	@Override
	public boolean update(BoardDTO updateDto) {
		
		boolean modifyResult = mapper.update(updateDto) == 1;
		
		return false;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		
		return mapper.totalCnt(cri);
	}

	@Transactional // == 실패하면 롤백
	@Override
	public boolean remove(int bno) {
		
		replyMapper.deleteAll(bno);
		
		return mapper.delete(bno) >0? true:false;
	}

	@Override
	public boolean delete(int bno) {
		// TODO Auto-generated method stub
		return false;
	}


}
