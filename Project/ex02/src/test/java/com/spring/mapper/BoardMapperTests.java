package com.spring.mapper;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

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
    public void testGetSeq() {
        log.info(mapper.getSeq());
    }

    @Test
    public void testPaging() {
        Criteria criteria = new Criteria();
        criteria.setAmount(10);
        criteria.setPageNum(1*criteria.getAmount());
        List<BoardVO> list = mapper.getListWithPaging(criteria);

        list.forEach(board -> log.info(board));
    }

    @Test
    public void testGetTotalCount() {
        log.info(mapper.getTotalCount());
    }

    @Test
    public void testSearch() {
        Criteria criteria = new Criteria();
        criteria.setKeyword("fa");
        criteria.setType("C");

        List<BoardVO> list = mapper.getListWithPaging(criteria);

        list.forEach(board -> log.info(board));
    }
}
