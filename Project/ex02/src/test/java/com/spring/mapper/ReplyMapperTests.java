package com.spring.mapper;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.stream.IntStream;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

    private Long[] bnoArr = {12L, 13L, 14L, 15L, 16L};

    @Setter(onMethod_ = @Autowired)
    private ReplyMapper replyMapper;

    @Test
    public void testCreate() {
        IntStream.rangeClosed(1, 10).forEach( i -> {
            ReplyVO vo = new ReplyVO();

            vo.setBno(bnoArr[i % 5]);
            vo.setReply("댓글 테스트 " + i);
            vo.setReplyer("replyer" + i);

            replyMapper.insert(vo);
        });
    }

    @Test
    public void testList() {
        Criteria criteria = new Criteria();

        //17L
        List<ReplyVO> replies = replyMapper.getListWithPaging(criteria, bnoArr[0]);
        replies.forEach(reply -> log.info(reply));
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

        ReplyVO vo = replyMapper.read(targetRno);

        vo.setReply("update Reply");
        int count = replyMapper.update(vo);
        log.info("Update count: " + count);
    }
    @Test
    public void testMapper() {
        log.info(replyMapper);
    }
}
