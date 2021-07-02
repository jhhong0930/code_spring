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
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
                        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTest {

    @Setter(onMethod_ = @Autowired)
    private WebApplicationContext ctx;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

    @Test
    public void testList() throws Exception {
        log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
        .andReturn()
        .getModelAndView()
        .getModelMap());
    }

    @Test
    public void testRead() throws Exception {
        log.info(mockMvc.perform(MockMvcRequestBuilders
                .get("/board/get")
                .param("bno", "29"))
                .andReturn()
                .getModelAndView()
                .getModelMap());
    }

    @Test
    public void testInsert() throws Exception {
        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/insert")
        .param("title", "new Title")
        .param("content", "new Content")
        .param("writer", "new Writer"))
        .andReturn().getModelAndView().getViewName();

        log.info(resultPage);
    }

    @Test
    public void testUpdate() throws Exception {
        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/update")
                .param("bno", "29")
                .param("title", "수정")
                .param("content", "수정")
                .param("writer", "수정")
        ).andReturn().getModelAndView().getViewName();

        log.info(resultPage);
    }

    @Test
    public void testDelete() throws Exception {
        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/delete")
                .param("bno", "29")
        ).andReturn().getModelAndView().getViewName();

        log.info(resultPage);
    }
}