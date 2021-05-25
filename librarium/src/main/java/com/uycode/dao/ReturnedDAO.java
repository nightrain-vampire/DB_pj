package com.uycode.dao;

import com.uycode.entity.OrderDetail;
import com.uycode.entity.Returned;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface ReturnedDAO extends JpaRepository<Returned, Integer> {
    @Query(value="SELECT new com.uycode.entity.OrderDetail(o.id, u.name, b.title, o.time, o.duetime, o.overdue) FROM " +
            "Book b INNER JOIN Returned o ON o.bid = b.id INNER JOIN User u ON o.uid = u.id ")
    List<OrderDetail> list();
}
