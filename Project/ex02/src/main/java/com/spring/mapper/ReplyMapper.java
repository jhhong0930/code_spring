package com.spring.mapper;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper {
    int insert(ReplyVO vo);
    ReplyVO read(Long rno);
    int delete (Long rno);
    int update(ReplyVO replyVO);
    List<ReplyVO> getListWithPaging(
            @Param("cri")Criteria criteria,
            @Param("bno") Long bno
        );

}
