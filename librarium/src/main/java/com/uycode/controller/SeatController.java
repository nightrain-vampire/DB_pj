package com.uycode.controller;

import com.uycode.entity.Seat;
import com.uycode.result.Result;
import com.uycode.result.ResultFactory;
import com.uycode.service.SeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class SeatController {
    @Autowired
    SeatService seatService;

    @GetMapping("/api/seats")
    public Result listSeats() {
        return ResultFactory.buildSuccessResult(seatService.list());
    }

    @PostMapping("/api/admin/content/seats")
    public Result addOrUpdateSeats(@RequestBody Seat seat) {
        if(seatService.addOrUpdates(seat)){
            return ResultFactory.buildSuccessResult("修改成功");
        }
        return ResultFactory.buildFailResult("参数错误，修改失败");
    }

    @DeleteMapping("/api/admin/content/seats/delete/{id}")
    public Result deleteSeat(@PathVariable("id") Integer id) {
        if (seatService.deleteById(id)) {
            return ResultFactory.buildSuccessResult("删除成功");
        }
        return ResultFactory.buildFailResult("参数错误，删除失败");
    }

    @GetMapping("/api/seatsearch")
    public Result searchResult(@RequestParam("keywords") String keywords) {
        if ("".equals(keywords)) {
            return ResultFactory.buildSuccessResult(seatService.list());
        } else {
            return ResultFactory.buildSuccessResult(seatService.Search(Integer.valueOf(keywords)));
        }
    }

    @GetMapping("/api/seat/{state}/seats")
    public Result listByStat(@PathVariable("state") int state) {
        if (0 != state) {
            return ResultFactory.buildSuccessResult(seatService.listByStat(state));
        } else {
            return ResultFactory.buildSuccessResult(seatService.list());
        }
    }
}
