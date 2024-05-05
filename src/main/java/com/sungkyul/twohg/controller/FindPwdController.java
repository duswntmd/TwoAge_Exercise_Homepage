package com.sungkyul.twohg.controller;

import com.sungkyul.twohg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/passpwd")
public class FindPwdController {

    @Autowired
    UserService userService;

    @GetMapping("/findPassword")
    public String showFindPasswordForm() {
        return "findPasswordForm";
    }

    @PostMapping("/findPassword")
    public String findPasswordByEmailAndId(
            @RequestParam("email") String email,
            @RequestParam("id") String id,
            Model model) {
        try {
            String password = userService.findPasswordByEmailAndId(email, id);
            if (password != null) {
                model.addAttribute("message", "비밀번호가 이메일로 전송되었습니다. 확인해주세요.");
            } else {
                model.addAttribute("error", "해당 이메일과 아이디로 가입된 사용자가 없습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "비밀번호 찾기 중 오류가 발생했습니다.");
        }
        return "findPasswordForm";
    }
}
