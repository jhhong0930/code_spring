package com.trip.service;

import com.trip.domain.Criteria;
import com.trip.domain.HotelVO;
import com.trip.mapper.HotelMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
@AllArgsConstructor
public class HotelServiceImpl implements HotelService{

    private HotelMapper hotelMapper;

    @Override
    public List<HotelVO> getList(Criteria criteria) {
        return hotelMapper.getListWithPaging(criteria);
    }

    @Override
    public void insert(HotelVO hotelVO) {
        log.info("insert....." + hotelVO);
        hotelMapper.insert(hotelVO);
    }

    @Override
    public HotelVO read(int hno) {
        return hotelMapper.read(hno);
    }

    @Override
    public int update(HotelVO hotelVO) {
        log.info("Update : " + hotelVO);
        return hotelMapper.update(hotelVO);
    }

    @Override
    public int delete(int hno) {
        return hotelMapper.delete(hno);
    }

    @Override
    public int getTotalCount() {
        return hotelMapper.getTotalCount();
    }
}
