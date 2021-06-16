## Chapter 09. 비즈니스 계층



- 비즈니스 계층
  - 고객의 요구사항을 반영하는 계층
  - presentation과 persistance 계층의 중간다리 역할을 한다.
  - persistance는 데이터베이스를 기준으로 설계를 나눠 구현,
    비즈니스 계층은 로직을 기준으로 처리.



- 비즈니스 계층의 설정 및 테스트

  - 설정

    - file : src/main/java/com/spring/service/BoardService.java

    ```java
    package com.spring.service;
    
    import com.spring.domain.BoardVO;
    
    import java.util.List;
    
    public interface BoardService {
        public void register(BoardVO boardVO);
    
        public BoardVO get(Long bno);
    
        public boolean modify(BoardVO boardVO);
    
        public boolean remove(Long bno);
    
        public List<BoardVO> getList();
    
    }
    
    ```

    - file : src/main/java/com/spring/service/BoardServiceImpl.java

    ```java
    package com.spring.service;
    
    import com.spring.domain.BoardVO;
    import com.spring.mapper.BoardMapper;
    import lombok.AllArgsConstructor;
    import lombok.Setter;
    import lombok.extern.log4j.Log4j;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;
    
    import java.util.List;
    
    @Log4j
    @Service
    public class BoardServletImpl implements BoardService {
    
        @Setter(onMethod_ = @Autowired)
        private BoardMapper mapper;
    
        @Override
        public void register(BoardVO boardVO) {
            log.info("register.........." + boardVO);
            mapper.insert(boardVO);
        }
    
        @Override
        public BoardVO get(Long bno) {
            log.info("get.........." + bno);
            return mapper.read(bno);
        }
    
        @Override
        public boolean modify(BoardVO boardVO) {
            log.info("modify........" + boardVO);
            return mapper.update(boardVO) == 1;
        }
    
        @Override
        public boolean remove(Long bno) {
            log.info("remove........." + bno);
            return mapper.delete(bno) == 1;
        }
    
        @Override
        public List<BoardVO> getList() {
            log.info("getList..............");
            return mapper.getList();
        }
    }
    ```

    

  - 테스트

    - file : src/test/java/com/spring/service/BoardServiceTests.java

    ```java
    package com.spring.service;
    
    import static org.junit.Assert.assertNotNull;
    
    import com.spring.domain.BoardVO;
    import org.junit.Test;
    import org.junit.runner.RunWith;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.test.context.ContextConfiguration;
    import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
    
    import lombok.Setter;
    import lombok.extern.log4j.Log4j;
    
    @RunWith(SpringJUnit4ClassRunner.class)
    @ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
    @Log4j
    public class BoardServiceTests {
        @Setter(onMethod_ = {@Autowired})
        private BoardService service;
    
        @Test
        public void testExist() {
            log.info(service);	
            assertNotNull(service);
        }
    
        @Test
        public void testRegister() {
            BoardVO boardVO = new BoardVO();
            boardVO.setTitle("new title");
            boardVO.setContent("new content");
            boardVO.setWriter("newbie");
    
            service.register(boardVO);
            log.info("BNO : " + boardVO.getBno());
        }
    
        @Test
        public void testGetList() {
            service.getList().forEach(boardVO -> log.info(boardVO));
        }
    
        @Test
        public void testGet() {
            log.info(service.get(1L));
        }
    
        @Test
        public void testDelete() {
            log.info("REMOVE RESULT : " + service.remove(1L));
        }
    
        @Test
        public void testUpdate() {
            BoardVO boardVO = service.get(1L);
    
            if(boardVO == null)
                return ;
    
            boardVO.setTitle("Modify Title");
            log.info("MODIFY RESULT : " + service.modify(boardVO));
        }
    }
    ```

    

