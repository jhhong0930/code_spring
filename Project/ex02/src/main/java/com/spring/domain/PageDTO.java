package com.spring.domain;

<<<<<<< HEAD
import lombok.Data;
=======
>>>>>>> 7589bcba3e5f48d6eba3af0c73c9fb7ab29a4814
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
<<<<<<< HEAD
=======

>>>>>>> 7589bcba3e5f48d6eba3af0c73c9fb7ab29a4814
    private int startPage;
    private int endPage;
    private boolean prev, next;

    private int total;
<<<<<<< HEAD
    private Criteria criteria;

    public PageDTO(Criteria cri, int total) {
        this.criteria = cri;
        this.total = total;

        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
        this.startPage = this.endPage - 9;

        int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));

        if(realEnd < this.endPage) {
=======
    private Criteria cri;

    public PageDTO(Criteria cri, int total) {

        this.cri = cri;
        this.total = total;

        this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

        this.startPage = this.endPage - 9;

        int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

        if (realEnd <= this.endPage) {
>>>>>>> 7589bcba3e5f48d6eba3af0c73c9fb7ab29a4814
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;
<<<<<<< HEAD
        this.next = this.endPage < realEnd;
    }
}

=======

        this.next = this.endPage < realEnd;
    }

}
>>>>>>> 7589bcba3e5f48d6eba3af0c73c9fb7ab29a4814
