package com.uycode.dao;

import com.uycode.entity.StarDetail;
import com.uycode.entity.Starred;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface StarredDAO extends JpaRepository<Starred,Integer> {
    @Query(value = "select * from starred where uid = :uid", nativeQuery = true)
    List<Starred> findByUid(@Param("uid") Integer uid);

    Starred findByUidAndBid(Integer uid, Integer bid);

    @Query(value="SELECT new com.uycode.entity.StarDetail(o.id, u.name, b.title, o.time) FROM Starred o INNER JOIN User u ON o.uid = u.id INNER JOIN Book" +
            " b ON o.bid = b.id")
    List<StarDetail> list();
}
