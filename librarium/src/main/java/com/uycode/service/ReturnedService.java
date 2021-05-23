package com.uycode.service;

import com.uycode.dao.BookDAO;
import com.uycode.dao.ReturnedDAO;
import org.springframework.beans.factory.annotation.Autowired;

public class
ReturnedService {

    @Autowired
    ReturnedDAO returnedDAO;

    @Autowired
    BookDAO bookDAO;

}
