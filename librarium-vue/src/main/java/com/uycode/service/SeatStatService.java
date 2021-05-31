package com.uycode.service;

import com.uycode.dao.SeatStatDAO;
import com.uycode.entity.SeatStat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SeatStatService {
    @Autowired
    SeatStatDAO seatStatDAO;

    public List<SeatStat> list() {
        Sort sort = new Sort(Sort.Direction.DESC,"id");
        return seatStatDAO.findAll(sort);
    }

    public SeatStat get(int id) {
        SeatStat s = seatStatDAO.findById(id).orElse(null);
        return s;
    }
}
