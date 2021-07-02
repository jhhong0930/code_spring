package com.spring.service;

import com.spring.mapper.Sample1Mapper;
import com.spring.mapper.Sample2Mapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Log4j
@AllArgsConstructor
public class SampleTxServiceImpl implements SampleTxService{

    private Sample1Mapper mapper1;

    private Sample2Mapper mapper2;

    @Transactional
    @Override
    public void addData(String value) {

        log.info("mapper1................");
        mapper1.insertCol1(value);

        log.info("mapper2................");
        mapper2.insertCol2(value);

        log.info("end....................");

    }



}
