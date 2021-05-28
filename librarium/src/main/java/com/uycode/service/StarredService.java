package com.uycode.service;

import com.uycode.dao.StarredDAO;
import com.uycode.entity.Starred;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class StarredService {
    @Autowired
    private StarredDAO starredDAO;

    public List<Starred> listStarred() {
        List<Starred> starreds = starredDAO.findAll();
        return starreds;
    }
}
