package com.sungkyul.twohg.controller;

import com.sungkyul.twohg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/passid")
public class FindIdController {

    @Autowired
    UserService userService;

    @GetMapping("/findid")
    public String showFindIdForm() {
        return "findIdForm";
    }

    @PostMapping("/findid")
    public String findIdByEmailAndName(
            @RequestParam("email") String email,
            @RequestParam("name") String name,
            Model model) {
        try {
            String id = userService.findIdByEmailAndName(email, name);
            if (id != null) {
                model.addAttribute("message", "아이디가 이메일로 전송되었습니다. 확인해주세요.");
            } else {
                model.addAttribute("error", "해당 이메일과 이름로 가입된 사용자가 없습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "아이디 찾기 중 오류가 발생했습니다.");
        }
        return "findIdForm";
    }
}
