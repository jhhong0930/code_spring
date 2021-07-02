package com.spring.mapper;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.stream.IntStream;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

    private Long[] bnoArr = { 500L, 499L, 498L, 497L, 496L };

    @Setter(onMethod_ = @Autowired)
    private ReplyMapper replyMapper;

    @Test
    public void testCreate() {
        IntStream.rangeClosed(1, 10).forEach( i -> {

            ReplyVO vo = new ReplyVO();

            //게시물 번호
            vo.setBno(bnoArr[i % 5]);
            vo.setReply("댓글 테스트" + i);
            vo.setReplyer("replier" + i);

            replyMapper.insert(vo);
        });
    }

    @Test
    public void testRead() {
        Long targetRno = 10L;

        ReplyVO vo = replyMapper.read(targetRno);

        log.info(vo);
    }

    @Test
    public void testDelete() {
        Long targetRno = 1L;
        replyMapper.delete(targetRno);
    }

    @Test
    public void testUpdate() {
        Long targetRno = 10L;

        ReplyVO replyVO = replyMapper.read(targetRno);
        replyVO.setReply("Update Reply");

        int count = replyMapper.update(replyVO);

        log.info("UPDATE COUNT : " + count);
    }

    @Test
    public void getListWithPaging() {
        Criteria criteria = new Criteria();

        List<ReplyVO> replies = replyMapper.getListWithPaging(criteria, bnoArr[0]);

        replies.forEach(reply -> log.info(reply) );
    }
    @Test
    public void testMapper() {
        log.info(replyMapper);
    }
}
