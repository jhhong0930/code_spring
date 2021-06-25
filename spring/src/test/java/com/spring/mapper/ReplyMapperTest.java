package com.spring.mapper;

import com.spring.domain.BoardVO;
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
public class ReplyMapperTest {

    private Long[] bnoArr = {24L, 23L, 22L, 21L, 20L};

    @Setter(onMethod_ = @Autowired)
    private ReplyMapper mapper;

    @Test
    public void testCreate() {
        IntStream.rangeClosed(1, 10).forEach(i -> {
            ReplyVO vo = new ReplyVO();
            vo.setBno(bnoArr[i % 5]);
            vo.setReply("댓글 테스트 " + i);
            vo.setReplyer("replyer" + i);
            mapper.insert(vo);
        });

    }

    @Test
    public void testMapper() {
        log.info(mapper);
    }

    @Test
    public void testRead() {

        Long targetRno = 1L;

        ReplyVO vo = mapper.read(targetRno);

        log.info(vo);

    }

    @Test
    public void testDelete() {

        Long targetRno = 1L;

        mapper.delete(targetRno);
    }

    @Test
    public void testUpdate() {

        Long targetRno = 11L;

        ReplyVO vo = mapper.read(targetRno);

        vo.setReply("update Reply");

        int count = mapper.update(vo);

        log.info("UPDATE COUNT: " + count);

    }

    @Test
    public void testList() {

        Criteria cri = new Criteria();

        List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);

        replies.forEach(reply -> log.info(reply));

    }

}
