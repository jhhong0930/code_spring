package com.spring.domain;

<<<<<<< HEAD
=======

import lombok.Data;
>>>>>>> 7589bcba3e5f48d6eba3af0c73c9fb7ab29a4814
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

<<<<<<< HEAD
@Getter
@Setter
@ToString
=======
@ToString
@Setter
@Getter
>>>>>>> 7589bcba3e5f48d6eba3af0c73c9fb7ab29a4814
public class Criteria {

    private int pageNum;
    private int amount;

<<<<<<< HEAD
    public Criteria() {
        this(0, 10);
    }

    public Criteria(int pageNum, int amount){
        this.pageNum = pageNum;
        this.amount = amount;
    }
}
=======
    private String type;
    private String keyword;

    public Criteria() {
        this(1, 10);
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

    public String[] getTypeArr() {
        if (type == null){
            return new String[] {};
        } else {
            return type.split("");
        }
    }
}


>>>>>>> 7589bcba3e5f48d6eba3af0c73c9fb7ab29a4814
