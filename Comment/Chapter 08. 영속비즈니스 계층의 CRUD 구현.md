## Chapter 08. 영속/비즈니스 계층의 CRUD 구현



#### persistence 진행 순서

1. 테이블의 컬럼 구조를 반영하는 **VO**, **DTO**클래스의 생성
2. Mybatis의 **Mapper 인터페이스** 작성 및 **XML** 처리
3. 작성한 Mapper 인터페이스의 **테스트**



##### VO 클래스 작성

- file : src/main/java/com/spring/domain/BoardVO.java

```java
package com.spring.domain;

import lombok.Data;

import java.util.Date;

@Data
public class BoardVO {
    private Long bno;
    private String title;
    private String content;
    private String writer;
    private Date regDate;
    private Date updateDate;
}
```

