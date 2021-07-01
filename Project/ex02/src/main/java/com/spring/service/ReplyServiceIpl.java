package com.spring.service;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;
import com.spring.mapper.ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceIpl implements ReplyService{

    private ReplyMapper replyMapper;

    @Override
    public int register(ReplyVO vo) {
        return replyMapper.insert(vo);
    }

    @Override
    public ReplyVO get(Long rno) {
        return replyMapper.read(rno);
    }

    @Override
    public int modify(ReplyVO replyVO) {
        return replyMapper.update(replyVO);
    }

    @Override
    public int remove(Long rno) {
        return replyMapper.delete(rno);
    }

    @Override
    public List<ReplyVO> getList(Criteria criteria, Long bno) {
        return replyMapper.getListWithPaging(criteria, bno);
    }
}
