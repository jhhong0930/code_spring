package com.spring.controller;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;
import com.spring.service.ReplyService;
import com.sun.xml.internal.ws.api.ha.StickyFeature;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
public class ReplyController {
    private ReplyService replyService;

    @PostMapping(value = "/new",
            consumes = "application/json",
            produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> create(@RequestBody ReplyVO replyVO) {
        log.info("ReplyVO : " + replyVO);

        int insertCount = replyService.register(replyVO);

        return insertCount == 1 ?
                new ResponseEntity<>("success", HttpStatus.OK) :
                new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @GetMapping(value = "/pages/{bno}/{page}")
    public ResponseEntity<List<ReplyVO>> getList(
            @PathVariable("page") int page,
            @PathVariable("bno") Long bno) {
        log.info("getList....................");
        Criteria criteria = new Criteria(page, 10);
        log.info(criteria);

        return new ResponseEntity<>(replyService.getList(criteria, bno), HttpStatus.OK);
    }

    @GetMapping(value = "/{rno}")
    public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {
        log.info("get: " + rno);
        return new ResponseEntity<>(replyService.get(rno), HttpStatus.OK);
    }

    @DeleteMapping(value = "/{rno}")
    public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
        log.info("remove: " + rno);
        return replyService.remove(rno) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK):
                new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
    value = "/{rno}",
    consumes = "application/json")
    public ResponseEntity<String> modify (
            @RequestBody ReplyVO replyVO,
            @PathVariable("rno") Long rno
    ) {
        replyVO.setRno(rno);
        log.info("rno: " + rno);

        log.info("modify: " + replyVO);

        return replyService.modify(replyVO) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK):
                new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
