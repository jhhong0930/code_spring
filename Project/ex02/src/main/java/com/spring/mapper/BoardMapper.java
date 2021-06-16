package com.spring.mapper;

import com.spring.domain.BoardVO;

import java.util.List;

public interface BoardMapper {
    public List<BoardVO> getList();

    void insert(BoardVO board);

    void insertSelectKey(BoardVO board);

    BoardVO read(Long bno);

    int delete(Long bno);

    int update(BoardVO board);

    int getSeq();
}
