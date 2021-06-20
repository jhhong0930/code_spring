package com.spring.controller;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.PageDTO;
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
    public void list(Criteria cri, Model model) {
        log.info("list: " + cri);
        model.addAttribute("list", service.getList(cri));
        model.addAttribute("pageMaker", new PageDTO(cri, service.getTotalCount()));
        log.info(service.getTotalCount());
    }

    @GetMapping("/register")
    public void register() {

    }

    @PostMapping("/register")
    public String register(BoardVO boardVO, RedirectAttributes rttr) {
        log.info("register: " + boardVO);

        service.register(boardVO);

        int Seq = service.getSeq();
        rttr.addFlashAttribute("result", Seq);

        return "redirect:/board/list";
    }

    @GetMapping({"/get", "/modify"})
    public void get(@RequestParam("bno") Long bno, Model model) {
        log.info("/get or modify");
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