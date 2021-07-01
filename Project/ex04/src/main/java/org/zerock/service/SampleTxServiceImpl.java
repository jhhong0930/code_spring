package org.zerock.service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.mapper.Sample1Mapper;
import org.zerock.mapper.Sample2Mapper;

@Service
@Log4j
@AllArgsConstructor
public class SampleTxServiceImpl implements SampleTxService {

    private Sample1Mapper mapper1;

    private Sample2Mapper mapper2;

    @Transactional
    @Override
    public void addData(String value) {
        log.info("mapper1.....................");
        mapper1.insertCol1(value);

        log.info("mapper2.....................");
        mapper2.insertCol2(value);

        log.info("end.........................");
    }
}
