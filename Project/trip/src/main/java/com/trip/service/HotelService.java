package com.trip.service;

import com.trip.domain.Criteria;
import com.trip.domain.HotelVO;

import java.util.List;

public interface HotelService {

    List<HotelVO> getList(Criteria criteria);

    void insert(HotelVO hotelVO);

    HotelVO read(int hno);

    int update(HotelVO hotelVO);

    int delete(int hno);

    int getTotalCount();
}
