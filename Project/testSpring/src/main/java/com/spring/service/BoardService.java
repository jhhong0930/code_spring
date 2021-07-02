package com.spring.service;

import com.spring.domain.BoardVO;

import java.util.List;

public interface BoardService {

    // Create
    int insert(BoardVO boardVO);

    // Read (one)
    BoardVO read(int bno);

    // Read (List)
    List<BoardVO> getList();

    // Update
    int update(BoardVO boardVO);

    // Delete
    int delete(int bno);

    int getSeq();

}
