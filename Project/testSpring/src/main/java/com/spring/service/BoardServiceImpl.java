package com.spring.service;

import com.spring.domain.BoardVO;
import com.spring.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

    private BoardMapper boardMapper;
    @Override
    public int insert(BoardVO boardVO) {
        return boardMapper.insert(boardVO);
    }

    @Override
    public BoardVO read(int bno) {
        return boardMapper.read(bno);
    }

    @Override
    public List<BoardVO> getList() {
        return boardMapper.getList();
    }

    @Override
    public int update(BoardVO boardVO) {
        return boardMapper.update(boardVO);
    }

    @Override
    public int delete(int bno) {
        return boardMapper.delete(bno);
    }

    @Override
    public int getSeq() {
        return boardMapper.getSeq();
    }
}
