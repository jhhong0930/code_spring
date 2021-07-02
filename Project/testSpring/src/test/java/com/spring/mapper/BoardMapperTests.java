package com.spring.mapper;

import com.spring.domain.BoardVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

    @Setter(onMethod_ = @Autowired)
    private BoardMapper boardMapper;

    @Test
    public void testGetList() {
        boardMapper.getList().forEach( board -> log.info(board));
    }

    @Test
    public void testRead() {
        log.info(boardMapper.read(25));
    }

    @Test
    public void testInsert() {
        BoardVO boardVO = new BoardVO();

        boardVO.setTitle("한글");
        boardVO.setWriter("test");
        boardVO.setContent("test");
        int count = boardMapper.insert(boardVO);
        log.info(count);
    }

    @Test
    public void testUpdate() {
        BoardVO boardVO = boardMapper.read(26);
        boardVO.setTitle("Modify test");
        boardVO.setWriter("Modify test");
        boardVO.setContent("Modify test");
        int count = boardMapper.insert(boardVO);
        log.info(count);
    }

    @Test
    public void testDelete() {
        int count = boardMapper.delete(26);
        log.info(count);
    }
}
