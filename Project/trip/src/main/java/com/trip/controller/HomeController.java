package com.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/")
    public String topClass(Model model) throws Exception {
//        List<BoardVO> list = boardService.topClass();
//        model.addAttribute("list", list);
        return "/index";
    }
}
