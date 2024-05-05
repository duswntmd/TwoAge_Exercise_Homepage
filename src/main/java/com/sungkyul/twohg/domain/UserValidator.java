package com.sungkyul.twohg.domain;

import com.sungkyul.twohg.domain.User;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserValidator implements Validator {


    @Override
    //이 검증기로 검증가능한 객체인지 알려주는 메서드
    public boolean supports(Class<?> clazz) {
//		return User.class.equals(clazz); // 검증하려는 객체가 User타입인지 확인
        return User.class.isAssignableFrom(clazz); // clazz가 User 또는 그 자손인지 확인
    }

    @Override
    public void validate(Object target, Errors errors) {
        System.out.println("UserValidator.validate() is called");

        User user = (User)target;

        String id = user.getId();
        String pwd = user.getPwd();

//		if(id==null || "".equals(id.trim())) {
//			errors.rejectValue("id", "required");
//		}
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id",  "required");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "required");



        if(id==null || id.length() <  4 || id.length() > 10) {
            errors.rejectValue("id", "invalidLength", new String[]{"4","10"}, null);
        }
        if(pwd==null || pwd.length() <  4 || pwd.length() > 10) {
            errors.rejectValue("pwd", "invalidLength", new String[]{"4","10"}, null);
        }

    }
}