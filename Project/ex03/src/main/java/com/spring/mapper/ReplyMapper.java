package com.spring.mapper;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper {

    //Create
    int insert(ReplyVO vo);

    //Read
    ReplyVO read (Long bno);

    //Delete
    int delete (Long hno);

    int update (ReplyVO replyVO);

    List<ReplyVO> getListWithPaging
            (
                @Param("cri")Criteria cri,
                @Param("bno") Long bno
            );
}
