package com.spring.mapper;

import com.spring.domain.BoardVO;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BoardMapper {

//    @Select("select * from tbl_board where bno > 0")
    List<BoardVO> getList();


    //Create
    void insert(BoardVO boardVO);
    void insertSelectKey(BoardVO boardVO);

    //Read
    BoardVO read(Long bno);

    //Update
    int update(BoardVO boardVO);

    //Delete
    int delete(Long bno);
}
