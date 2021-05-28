package com.uycode.dao;

import com.uycode.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface ReturnedDAO extends JpaRepository<Returned, Integer> {
    @Query(value = "select * from returned where uid = :uid", nativeQuery = true)
    List<Returned> findByUid(@Param("uid") Integer uid);

    Returned findById(int id);

   @Query(value="SELECT new com.uycode.entity.ReturnedDetail(o.id, u.name, b.title, o.time, o.duetime) FROM " +
            "Returned o INNER JOIN Book b ON o.bid = b.id INNER JOIN User u ON o.uid = u.id ")
    List<ReturnedDetail> list();


}
