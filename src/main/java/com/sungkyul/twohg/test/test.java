package com.sungkyul.twohg.test;


import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/test")
public class test {

    @GetMapping("/test")
    public String hello() {
//        return ResponseEntity.ok()
//                .contentType(MediaType.TEXT_PLAIN)
//                .body("테스트입니다ef.");
//        return "fronttest";
          return  "fronttest";
    }
}
