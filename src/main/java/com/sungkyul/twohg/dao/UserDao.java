package com.sungkyul.twohg.dao;

import com.sungkyul.twohg.domain.*;
import com.sungkyul.twohg.domain.User;

public interface UserDao {


    User selectUser(String id) throws Exception;
    int deleteUser(String id, String name, String pwd) throws Exception;
    int insertUser(User user) throws Exception;
    int updateUser(User user) throws Exception;



    User getUserById(String id, String name, String pwd) throws Exception;

    int count() throws Exception;
    void deleteAll() throws Exception;

    boolean isIdDuplicate(String id) throws Exception;


    // 아이디찾기
    String findIdByEmailAndName(String email, String name) throws Exception;

    String findPasswordByEmailAndId(String email, String id) throws Exception;
}