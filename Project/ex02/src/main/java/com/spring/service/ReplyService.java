package com.spring.service;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyService {
    int register(ReplyVO vo);
    ReplyVO get(Long rno);
    int modify(ReplyVO replyVO);
    int remove (Long rno);
    List<ReplyVO> getList(Criteria criteria, Long bno);
}
