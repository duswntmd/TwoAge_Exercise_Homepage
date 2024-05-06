package com.sungkyul.twohg.controller;

import com.sungkyul.twohg.dao.UserDao;
import com.sungkyul.twohg.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/updateid")
public class UpdateUserController {

    private final UserDao userDao;

    @Autowired
    public UpdateUserController(UserDao userDao) {
        this.userDao = userDao;
    }

    @GetMapping("/updateuser")
    public String showUpdateUserForm() {
        return "updateUser";
    }

    @GetMapping("/confirmuser")
    public String showConfirmUserForm() {
        return "confirmUser";
    }

    @PostMapping("/confirmuser")
    public String confirmUser(@RequestParam("id") String id, @RequestParam("name") String name,
                              @RequestParam("pwd") String pwd, Model model) {
        try {
            User user = userDao.getUserById(id, name, pwd);
            if (user != null) {
                model.addAttribute("user", user);
                return "updateUser";
            } else {
                model.addAttribute("error", "일치하는 사용자가 없습니다.");
                return "confirmUser";
            }
        } catch (Exception e) {
            model.addAttribute("error", "사용자 정보 확인 중 오류가 발생했습니다: ");
            return "confirmUser";
        }
    }

    @PostMapping("/updateuser")
    public String updateUser(@RequestParam("id") String id,
                             @RequestParam("pwd") String password,
                             @RequestParam("name") String name,
                             @RequestParam("email") String email,
                             @RequestParam("birth") String birth,
                             @RequestParam(value = "sns", required = false) String sns,
                             RedirectAttributes rattr,
                             Model model) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date birthDate = dateFormat.parse(birth);

            User user = new User();
            user.setId(id);
            user.setPwd(password);
            user.setName(name);
            user.setEmail(email);
            user.setBirth(birthDate);
            user.setSns(sns);

            int rowsAffected = userDao.updateUser(user);

            if (rowsAffected > 0) {
                rattr.addFlashAttribute("msg", "WRT_OK");
                return "redirect:/updateid/updateuser";
            } else {
                model.addAttribute("error", "사용자 정보 업데이트에 실패했습니다.");
            }
        } catch (ParseException e) {
            model.addAttribute("error", "생년월일 형식이 올바르지 않습니다.");
        } catch (Exception e) {
            model.addAttribute("error", "사용자 정보 업데이트 중 오류가 발생했습니다: ");
        }
        return "updateUser";
    }
}
