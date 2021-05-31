package com.uycode.service;

import com.uycode.dao.CommentDAO;
import com.uycode.entity.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/*业务层主要实现留言插入和查询功能*/
@Service
public class CommentService {
    @Autowired
    CommentDAO commentDAO;

    public Page list(int page,int size) {
        Sort sort = new Sort(Sort.Direction.DESC,"id");
        return commentDAO.findAll(PageRequest.of(page,size,sort));
    }

    public Comment findById(int id) {return commentDAO.findById(id);}

    public boolean addOrUpdate(Comment comment){
        try {
            commentDAO.save(comment);
        }catch (IllegalArgumentException e){
            return false;
        }
        return true;
    }

    public boolean delete(int id){
        try {
            commentDAO.deleteById(id);
        }catch (IllegalArgumentException e){
            return false;
        }
        return true;
    }
}
