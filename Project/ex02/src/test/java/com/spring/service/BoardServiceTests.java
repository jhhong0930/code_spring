package com.spring.service;

import static org.junit.Assert.assertNotNull;

import com.spring.domain.BoardVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
    @Setter(onMethod_ = {@Autowired})
    private BoardService service;

    @Test
    public void testExist() {
        log.info(service);
        assertNotNull(service);
    }

    @Test
    public void testRegister() {
        BoardVO boardVO = new BoardVO();
        boardVO.setTitle("new title");
        boardVO.setContent("new content");
        boardVO.setWriter("newbie");

        service.register(boardVO);
        log.info("BNO : " + boardVO.getBno());
    }

    @Test
    public void testGetList() {
        service.getList().forEach(boardVO -> log.info(boardVO));
    }

    @Test
    public void testGet() {
        log.info(service.get(1L));
    }

    @Test
    public void testDelete() {
        log.info("REMOVE RESULT : " + service.remove(1L));
    }

    @Test
    public void testUpdate() {
        BoardVO boardVO = service.get(1L);

        if(boardVO == null)
            return ;

        boardVO.setTitle("Modify Title");
        log.info("MODIFY RESULT : " + service.modify(boardVO));
    }
}
