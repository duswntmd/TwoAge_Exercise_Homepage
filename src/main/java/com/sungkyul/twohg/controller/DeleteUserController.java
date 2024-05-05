package com.sungkyul.twohg.controller;

import com.sungkyul.twohg.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DeleteUserController {

    private final UserDao userDao;

    @Autowired
    public DeleteUserController(UserDao userDao) {
        this.userDao = userDao;
    }

    @GetMapping("/deleteuser")
    public String showDeleteUserForm() {
        return "deleteUser";
    }

    @PostMapping("/deleteuser")
    public String deleteUser(
            @RequestParam String id,
            @RequestParam String name,
            @RequestParam String pwd,
            RedirectAttributes rattr,
            Model model) {
        try {
            int rowsAffected = userDao.deleteUser(id, name, pwd);
            if (rowsAffected > 0) {
//                return new ResponseEntity<>("User deleted successfully", HttpStatus.OK);
                model.addAttribute("message", "회원탈퇴가 성공했습니다.");
                return "index";
            } else {
//                return new ResponseEntity<>("User not found or credentials do not match", HttpStatus.NOT_FOUND);
                model.addAttribute("error", "회원탈퇴가 실패했습니다.");
                rattr.addFlashAttribute("msg", "DEL_ERR");
                return "redirect:/deleteuser";
            }
        } catch (Exception e) {
//            return new ResponseEntity<>("An error occurred: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
            e.printStackTrace();
            model.addAttribute("error", "회원탈퇴중 오류가 발생했습니다.");
        }
        return "deleteUser";
    }

}
