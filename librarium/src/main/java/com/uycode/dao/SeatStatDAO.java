package com.uycode.dao;

import com.uycode.entity.SeatStat;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SeatStatDAO extends JpaRepository<SeatStat,Integer> {
    //SeatStat findById(int id);
}
