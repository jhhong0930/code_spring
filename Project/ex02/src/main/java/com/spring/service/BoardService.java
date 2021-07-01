package com.spring.service;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

import java.util.List;

public interface BoardService {

    public void register(BoardVO board);

    public BoardVO get(Long bno);

    public boolean modify(BoardVO board);

    public boolean remove(Long bno);

<<<<<<< HEAD
    //public List<BoardVO> getList();

    public List<BoardVO> getList(Criteria criteria);

=======
    public List<BoardVO> getList(Criteria cri);
>>>>>>> 7589bcba3e5f48d6eba3af0c73c9fb7ab29a4814

    public int getSeq();

    int getTotalCount();
}