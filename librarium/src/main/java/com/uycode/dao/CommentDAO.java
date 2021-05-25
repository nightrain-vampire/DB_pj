package com.uycode.dao;


import com.uycode.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentDAO extends JpaRepository<Comment,Integer> {
    Comment findById(int id);
}
