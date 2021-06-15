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
    private BoardMapper mapper;

    @Test
    public void testGetList() {
        mapper.getList().forEach(log::info);
    }

    @Test
    public void testInsert() {
        BoardVO boardVO = new BoardVO();

        boardVO.setTitle("새로 작성하는 글");
        boardVO.setContent("새로 작성하는 내용");
        boardVO.setWriter("newbie");

        mapper.insert(boardVO);

        log.info(boardVO);
    }

    @Test
    public void testRead() {
        BoardVO boardVO = mapper.read(10L);
        log.info(boardVO);
    }

    @Test
    public void testUpdate() {
        BoardVO boardVO = new BoardVO();

        boardVO.setBno(10L);
        boardVO.setTitle("수정된 제목");
        boardVO.setContent("수정된 내용");
        boardVO.setWriter("modify user");

        int count = mapper.update(boardVO);
        log.info(count);
    }

    @Test
    public void testDelete() {
        log.info(mapper.delete(10L));
    }
}
