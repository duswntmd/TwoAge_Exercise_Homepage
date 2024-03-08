package com.sungkyul.twohg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:3000", allowCredentials = "true")
public class TestController {

    @GetMapping("/test")
    public ResponseEntity<String> hello(HttpServletRequest request) {
        return ResponseEntity.ok()
                .contentType(MediaType.TEXT_PLAIN)
                .body("테스트입니다efdf.");
    }

    @PostMapping("/ip")
    public ResponseEntity<String> ip (HttpServletRequest request) {
        // 요청을 보낸 클라이언트의 IP주소를 반환합니다.
        return ResponseEntity.ok(request.getRemoteAddr());
    }
}