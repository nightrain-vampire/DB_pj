package com.uycode.dao;


import com.uycode.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
public interface CommentDAO extends JpaRepository<Comment,Integer> {
    Comment findById(int id);

    @Query(value = "select * from comment where uid = :uid", nativeQuery = true)
    List<Comment> findByUid(@Param("uid") Integer uid);

    /*Comment findByUidAndCid(Integer uid, Integer cid);

    // @Query(value="SELECT new com.uycode.entity.Comment(c.uid, u.name, c.commentTitle, c.commentContentHtml, c.commentContentMd, c.commentTime) FROM Comment c NATURAL JOIN User u ON c.uid = u.id " )
    // List<Comment> list();*/
}
