package org.zerock.sample;

import lombok.Getter;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@ToString
@Getter
public class SampleHotel {

    private Chef chef;

    @Autowired
    public SampleHotel(Chef chef) {
        this.chef = chef;
    }
}
