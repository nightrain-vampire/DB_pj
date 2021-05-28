package com.uycode.service;

import com.uycode.dao.BookDAO;
import com.uycode.dao.ReturnedDAO;
import com.uycode.entity.Comment;
import com.uycode.entity.Ordered;
import com.uycode.entity.Book;
import com.uycode.entity.Returned;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReturnedService {

    @Autowired
    ReturnedDAO returnedDAO;

    public Page list(int page, int size) {
        Sort sort = new Sort(Sort.Direction.DESC,"id");
        return returnedDAO.findAll(PageRequest.of(page,size,sort));
    }

    public Returned findById(int id) {return returnedDAO.findById(id);}

    public boolean addOrUpdate(Returned returned){
        try {
            returnedDAO.save(returned);
        }catch (IllegalArgumentException e){
            return false;
        }
        return true;
    }

}
