package com.uycode.dao;

import com.uycode.entity.Seat;
import com.uycode.entity.SeatStat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SeatDAO extends JpaRepository<Seat,Integer> {
    List<Seat> findAllBySeatStat(SeatStat state);

    Seat findBySid(Integer sid);

    List<Seat> findAllBySid(Integer sid);
}
