package com.spring.controller;

import com.spring.domain.BoardVO;
import com.spring.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j
@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

    private BoardService boardService;

    @GetMapping("/list")
    public void getList(Model model) {
        model.addAttribute("list", boardService.getList());
        log.info("getList... : " + boardService.getList());
    }

    @GetMapping({"/get", "/update"})
    public void read(Model model, int bno) {
        model.addAttribute("board", boardService.read(bno));
    }

    @PostMapping("/insert")
    public String insert(BoardVO boardVO, RedirectAttributes rttr) {
        log.info("register: " + boardVO);
        boardService.insert(boardVO);
        rttr.addFlashAttribute("result", boardService.getSeq());
        log.info(boardService.getSeq());
        return "redirect:/board/list";
    }

    @PostMapping("/update")
    public String update(BoardVO boardVO) {
        boardService.update(boardVO);
        return "redirect:/board/list";
    }

    @PostMapping("/delete")
    public String delete(int bno) {
        boardService.delete(bno);
        return "redirect:/board/list";
    }

    @GetMapping("/insert")
    public void insert() {

    }
}
