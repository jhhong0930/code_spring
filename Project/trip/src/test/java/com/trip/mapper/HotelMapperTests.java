package com.trip.mapper;

import com.trip.domain.HotelVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HotelMapperTests {

    @Setter(onMethod_ = @Autowired)
    private HotelMapper hotelMapper;

    @Test
    public void getList(){
        hotelMapper.getList().forEach(hotel -> log.info(hotel));
    }

    @Test
    public void insert() {
        HotelVO hotelVO = new HotelVO();
        hotelVO.setName("NEW TITLE");
        hotelVO.setAddress("NEW ADDR");
        hotelVO.setGrade(1);
        hotelVO.setPhone("010-0000-0000");

        hotelMapper.insert(hotelVO);

        log.info(hotelVO);
    }

    @Test
    public void modify() {
        HotelVO hotelVO = new HotelVO();
        hotelVO.setHno(27);
//        hotelVO.setName("이름");
        hotelVO.setAddress("NEW ADDR");
//        hotelVO.setGrade(1);
        hotelVO.setPhone("010-0000-0000");

        int count = hotelMapper.update(hotelVO);
        log.info(hotelVO);
    }
}
