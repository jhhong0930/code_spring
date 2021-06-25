package com.spring.mapper;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper {

    int insert(ReplyVO vo);

    ReplyVO read(Long rno);

    int delete(Long rno);

    int update(ReplyVO reply);

    public List<ReplyVO> getListWithPaging(
            @Param("cri")Criteria cri,
            @Param("bno") Long bno);

}
