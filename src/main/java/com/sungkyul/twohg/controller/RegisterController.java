package com.sungkyul.twohg.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

//import com.sungkyul.twohg.service.UserService;
import com.sungkyul.twohg.domain.UserValidator;
import com.sungkyul.twohg.dao.UserDao;
import com.sungkyul.twohg.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

@Controller // ctrl+shift+o 자동 import
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    UserDao userDao;

    final int FAIL = 0;

    @InitBinder
    public void toDate(WebDataBinder binder) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(df, false));
        binder.setValidator(new UserValidator()); // UserValidator를 WebDataBinder의 로컬 validator로 등록
    }

    @GetMapping("/add")
    public String register() {
        return "registerForm"; // WEB-INF/views/registerForm.jsp
    }

    @PostMapping("/add")
    public String save(@Valid User user, BindingResult result, Model m) throws Exception {
        System.out.println("result="+result);
        System.out.println("user="+user);

        // User객체를 검증한 결과 에러가 있으면, registerForm을 이용해서 에러를 보여줘야 함.
        if(!result.hasErrors()) {

            if (userDao.isIdDuplicate(user.getId())) { // 아이디 중복 확인
                m.addAttribute("message", "이미 사용 중인 아이디입니다."); // 중복 아이디 메시지 추가
                return "registerForm"; // 회원가입 폼 다시 표시
            }
            // 2. DB에 신규회원 정보를 저장
            int rowCnt = userDao.insertUser(user);

            if(rowCnt!=FAIL) {
                return "index";
            }
        }

        return "registerForm";
    }

    private boolean isValid(User user) {
        return true;
    }
}