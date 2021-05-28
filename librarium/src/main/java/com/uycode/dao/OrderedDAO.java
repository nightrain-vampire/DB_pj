package com.uycode.dao;

import com.uycode.entity.Book;
import com.uycode.entity.OrderDetail;
import com.uycode.entity.Ordered;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.beans.Transient;
import java.util.List;
@Transactional
public interface OrderedDAO extends JpaRepository<Ordered, Integer> {

    @Query(value = "select * from ordered where uid = :uid", nativeQuery = true)
    List<Ordered> findByUid(@Param("uid") Integer uid);

    Ordered findByUidAndBid(Integer uid, Integer bid);

    @Query(value="SELECT new com.uycode.entity.OrderDetail(o.id, u.name, b.title, o.time, o.duetime) FROM Ordered o INNER JOIN Book b ON o.bid = b.id INNER JOIN User u ON o.uid = u.id " )
    List<OrderDetail> list();


}
