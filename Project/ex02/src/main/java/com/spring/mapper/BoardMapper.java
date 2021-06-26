package com.spring.mapper;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
<<<<<<< HEAD
=======
import org.apache.ibatis.annotations.Select;
>>>>>>> 7589bcba3e5f48d6eba3af0c73c9fb7ab29a4814

import java.util.List;

public interface BoardMapper {

    //    @Select("SELECT * FROM SPRING.BOARD WHERE BNO > 0")
    public List<BoardVO> getList();

<<<<<<< HEAD
    List<BoardVO> getListWithPaging(Criteria criteria);

    void insert(BoardVO board);
=======
    public List<BoardVO> getListWithPaging(Criteria cri);

    public void insert(BoardVO board);

    public void insertSelectKey(BoardVO board);
>>>>>>> 7589bcba3e5f48d6eba3af0c73c9fb7ab29a4814

    public BoardVO read(Long bno);

    public int delete(Long bno);

    public int update(BoardVO board);

    public int getSeq();

    int getTotalCount();
}