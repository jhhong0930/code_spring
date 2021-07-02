package com.trip.controller.hotel;

import com.trip.domain.Criteria;
import com.trip.domain.HotelVO;
import com.trip.domain.PageDTO;
import com.trip.service.HotelService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/hotel/*")
public class HotelController {

    private final HotelService hotelService;

    @GetMapping("/list")
    public void getList(Criteria criteria, Model model) {
        log.info("Controller getList..........");
        model.addAttribute("list", hotelService.getList(criteria));
        model.addAttribute("pageMaker", new PageDTO(criteria, hotelService.getTotalCount()));
        log.info(hotelService.getTotalCount());
    }

    //Read
    @GetMapping({"/detail", "/update"})
    public void read(@RequestParam("hno") int hno, Model model) {
        log.info("Detail or update" + hno);
        model.addAttribute("hotelVO", hotelService.read(hno));
    }

    //Create
    @PostMapping("/insert")
    public String insert(HotelVO hotelVO, RedirectAttributes rttr) {
        hotelService.insert(hotelVO);
        rttr.addFlashAttribute("result", hotelVO.getHno());
        return "redirect:/hotel/list";
    }

    //Update
    @PostMapping("/update")
    public String update(HotelVO hotelVO, RedirectAttributes rttr) {
        log.info("update: " + hotelVO);
        if(hotelService.update(hotelVO) > 0) {
            rttr.addFlashAttribute("hotelVO", "success");
        }
        return "redirect:/hotel/list";
    }

    //Delete
    @PostMapping("delete")
    public String delete(@RequestParam("hno") int hno, RedirectAttributes rttr) {
        hotelService.delete(hno);
        return "redirect:/hotel/list";
    }

}
