package com.trip.mapper;

import com.trip.domain.Criteria;
import com.trip.domain.HotelVO;

import java.util.List;

public interface HotelMapper {
    public List<HotelVO> getList();

    List<HotelVO> getListWithPaging(Criteria criteria);

    public HotelVO read(int hno);

    public int update(HotelVO hotelVO);

    public int delete(int hno);

    public void insert(HotelVO hotelVO);

    int getTotalCount();
}
