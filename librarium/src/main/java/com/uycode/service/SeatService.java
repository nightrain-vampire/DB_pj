package com.uycode.service;

import com.uycode.dao.SeatDAO;
import com.uycode.entity.Seat;
import com.uycode.entity.SeatStat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SeatService {
    @Autowired
    SeatDAO seatDAO;
    @Autowired
    SeatStatService seatStatService;

    public List<Seat> list() {
        Sort sort = new Sort(Sort.Direction.DESC,"id");
        return seatDAO.findAll(sort);
    }

    public boolean addOrUpdates(Seat seat) {
        try {
            seatDAO.save(seat);
        } catch (IllegalArgumentException e) {
            return false;
        }
        return true;
    }

    public boolean deleteById(int id) {
        try {
            seatDAO.deleteById(id);
        } catch (IllegalArgumentException e) {
            return false;
        }
        return true;
    }

    public List<Seat> listByStat(int id) {
        SeatStat seatStat = seatStatService.get(id);
        Sort sort = new Sort(Sort.Direction.DESC, "id");
        return seatDAO.findAllBySeatStat(seatStat);
    }

    public Seat Search(Integer keyword) {
        return seatDAO.findBySid(keyword);
    }
}
