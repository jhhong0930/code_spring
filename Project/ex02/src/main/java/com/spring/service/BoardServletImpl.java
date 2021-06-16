package com.spring.service;

import com.spring.domain.BoardVO;
import com.spring.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class BoardServletImpl implements BoardService {

    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;

    @Override
    public void register(BoardVO boardVO) {
        log.info("register.........." + boardVO);
        mapper.insert(boardVO);
    }

    @Override
    public BoardVO get(Long bno) {
        log.info("get.........." + bno);
        return mapper.read(bno);
    }

    @Override
    public boolean modify(BoardVO boardVO) {
        log.info("modify........" + boardVO);
        return mapper.update(boardVO) == 1;
    }

    @Override
    public boolean remove(Long bno) {
        log.info("remove........." + bno);
        return mapper.delete(bno) == 1;
    }

    @Override
    public List<BoardVO> getList() {
        log.info("getList..............");
        return mapper.getList();
    }
}
