package com.spring.mapper;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BoardMapper {

    //@Select("SELECT * FROM SPRING.BOARD WHERE BNO > 0")
    List<BoardVO> getList();

    List<BoardVO> getListWithPaging(Criteria cri);

    void insert(BoardVO board);

    void insertSelectKey(BoardVO board);

    BoardVO read(Long bno);

    int delete(Long bno);

    int update(BoardVO board);

    int getSeq();

    int getTotalCount();
}