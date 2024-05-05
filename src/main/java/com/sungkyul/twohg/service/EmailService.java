package com.sungkyul.twohg.service;

import com.sungkyul.twohg.domain.EmailDto;

public interface EmailService {
    public void sendMail(EmailDto dto);
}

