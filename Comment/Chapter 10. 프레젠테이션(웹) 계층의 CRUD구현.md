## Chapter10. 프레젠테이션(웹) 계층의 CRUD구현

### 학습 목표

WAS를 실행하지 않고 Controller를 테스트할 수 있는 방법을 학습하기!



### 설명

- 프레젠테이션 계층인 웹 구현.
- 스프링 MVC의 Contoller: 
  하나의 클래스 내에서 여러 메서드를 작성하고, @RequetMapping등을 이용해서 URL을 분기하는 구조로 작성할 수 있어 하나의 클래스에서 필요한만큼 메서드의 분기를 이용하는 구조로 작성됨. 



### BoardController의 분석

- controller를 작성하기 전에는 반드시 현재 원하는 기능을 호출하는 방식에 대해 **테이블**로 정리한 후 코드를 작성하는 것이 좋음.

|   Task    |       URL       | Method | Parameter |     From      | URL 이동 |
| :-------: | :-------------: | :----: | :-------: | :-----------: | :------: |
| 전체 목록 |   /board/list   |  GET   |           |               |          |
| 등록처리  | /board/register |  POST  | VO(전체)  | 입력화면 필요 |   이동   |
|   조회    |   /board/read   |  GET   |    bno    |               |          |
| 삭제처리  |  /board/remove  |  POST  |    bno    | 입력화면 필요 |   이동   |
| 수정처리  |  /board/modify  |  POST  | VO(전체)  | 입력화면 필요 |   이동   |



#### BoardController의 작성 및 테스트

- BoardController는 URL 분석된 내용들을 반영하는 메서드를 설계



- 작성

  - file : src/main/java/com/spring/controller/BoardController.java

  ```java
  package com.spring.controller;
  
  import com.spring.domain.BoardVO;
  import com.spring.service.BoardService;
  import lombok.Setter;
  import lombok.extern.log4j.Log4j;
  import org.springframework.beans.factory.annotation.Autowired;
  import org.springframework.stereotype.Controller;
  import org.springframework.ui.Model;
  import org.springframework.web.bind.annotation.GetMapping;
  import org.springframework.web.bind.annotation.PostMapping;
  import org.springframework.web.bind.annotation.RequestMapping;
  import org.springframework.web.bind.annotation.RequestParam;
  import org.springframework.web.servlet.mvc.support.RedirectAttributes;
  
  @Controller
  @Log4j
  @RequestMapping("/board/*")
  public class BoardController {
  
      @Setter(onMethod_ = {@Autowired})
      private BoardService service;
  
      @GetMapping("/list")
      public void list(Model model) {
          log.info("list");
          model.addAttribute("list", service.getList());
      }
  
      @PostMapping("/register")
      public String register(BoardVO boardVO, RedirectAttributes rttr) {
          log.info("register: " + boardVO);
  
          service.register(boardVO);
  
          rttr.addFlashAttribute("result", boardVO.getBno());
  
          return "redirect:/board/list";
      }
  
      @GetMapping("/get")
      public void get(@RequestParam("bno") Long bno, Model model) {
          log.info("/get");
          model.addAttribute("board", service.get(bno));
      }
  
      @PostMapping("/modify")
      public String modify(BoardVO boardVO, RedirectAttributes rttr) {
          log.info("modify" + boardVO);
  
          if(service.modify(boardVO)) {
              rttr.addFlashAttribute("result", "success");
          }
          return "redirect:/board/list";
      }
  
      @PostMapping("remove")
      public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
          log.info("/remove....." + bno);
          if(service.remove(bno)) {
              rttr.addFlashAttribute("result", "success");
          }
          return "redirect:/board/list";
      }
  }
  ```



- 테스트

  - file : src/test/com/spring/controller/BoardControllerTests.java

  ```java
  package com.spring.controller;
  
  import lombok.Setter;
  import lombok.extern.log4j.Log4j;
  import org.junit.Before;
  import org.junit.Test;
  import org.junit.runner.RunWith;
  import org.springframework.beans.factory.annotation.Autowired;
  import org.springframework.test.context.ContextConfiguration;
  import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
  import org.springframework.test.context.web.WebAppConfiguration;
  import org.springframework.test.web.servlet.MockMvc;
  import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
  import org.springframework.test.web.servlet.setup.MockMvcBuilders;
  import org.springframework.web.context.WebApplicationContext;
  
  @RunWith(SpringJUnit4ClassRunner.class)
  @WebAppConfiguration
  @ContextConfiguration({
          "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
          "file:src/main/webapp/WEB-INF/spring/root-context.xml"})
  @Log4j
  public class BoardControllerTests{
  
      @Setter(onMethod_ = @Autowired)
      private WebApplicationContext ctx;
      
      private MockMvc mockMvc;
      
      @Before
      public void setup() {
          this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
      }
  
      @Test
      public void testGetList() throws Exception {
          log.info(
                  mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
                  .andReturn()
                  .getModelAndView()
                  .getModelMap()
          );
      }
      
      @Test
      public void testRegister() throws Exception {
          String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
                  .param("title", "테스트 새글 제목")
                  .param("content", "테스트 새글 내용")
                  .param("writer", "user00")
          ).andReturn().getModelAndView().getViewName();
  
          log.info(resultPage);
      }
  
      @Test
      public void testGet() throws Exception {
          log.info(mockMvc.perform(MockMvcRequestBuilders
                  .get("/board/get")
                  .param("bno", "2"))
                  .andReturn()
                  .getModelAndView().getModelMap());
      }
  
      @Test
      public void testModify() throws Exception {
          String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
                  .param("bno", "1")
                  .param("title", "수정된 테스트 새글 제목")
                  .param("content", "수정된 테스트 새글 내용")
                  .param("writer", "user00"))
                  .andReturn().getModelAndView().getViewName();
          log.info(resultPage);
      }
  
      @Test
      public void testRemove() throws Exception {
          String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
                  .param("bno", "1"))
                  .andReturn().getModelAndView().getViewName();
          log.info(resultPage);
      }
  }
  ```

  @WebAppConfiguration은 WebApplicationContext라는 존재를 이용하기 위해서 사용.

  MockMvc는 말그대로 ''가짜mvc'이다.

  