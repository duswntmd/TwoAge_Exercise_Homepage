package com.sungkyul.twohg.service;

import com.sungkyul.twohg.domain.EmailDto;

public interface UserService {

//    String findPasswordByEmail(String email) throws Exception;

    String findIdByEmailAndName(String email, String name) throws Exception;

    String findPasswordByEmailAndId(String email, String id) throws Exception;
}

