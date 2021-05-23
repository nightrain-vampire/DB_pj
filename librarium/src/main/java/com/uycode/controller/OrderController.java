package com.uycode.controller;

import com.uycode.dao.BookDAO;
import com.uycode.dao.OrderedDAO;
import com.uycode.dao.ReturnedDAO;
import com.uycode.entity.Book;
import com.uycode.entity.OrderDetail;
import com.uycode.entity.Ordered;
import com.uycode.entity.Returned;
import com.uycode.result.Result;
import com.uycode.result.ResultFactory;
import com.uycode.service.BookService;
import com.uycode.service.OrderedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@RestController
public class OrderController {

    @Autowired
    OrderedDAO orderedDAO;

    @Autowired
    BookService bookService;

    @Autowired
    BookDAO bookDAO;

    @Autowired
    ReturnedDAO returnedDAO;

    @PostMapping("/api/borrow")
    public Result setBorrow(@RequestBody Ordered brw){
        Ordered already = orderedDAO.findByUidAndBid(brw.getUid(), brw.getBid());
        if(already != null){
            return ResultFactory.buildFailResult("already");
        }
        orderedDAO.save(brw);
        return ResultFactory.buildSuccessResult(brw);
    }

    @DeleteMapping("/api/bookReturn/{uid}/{bid}")
    public Result returnByUser(@PathVariable("uid") Integer uid,
                             @PathVariable("bid") Integer bid){
        Ordered ordered = orderedDAO.findByUidAndBid(uid, bid);
        Returned returned = new Returned();
        returned.setUid(uid);
        returned.setBid(bid);
        LocalDateTime returnedTime = LocalDateTime.now();
        int year = returnedTime.getYear();
        int month = returnedTime.getMonthValue();
        int day = returnedTime.getDayOfMonth();
        int hour = returnedTime.getHour();
        int minute = returnedTime.getMinute();
        int seconds = returnedTime.getSecond();
        String returnedTimeString = year +"年"+month+"月"+day+"  "+hour+":"+minute+":"+seconds;
        returned.setTime(returnedTimeString);
        returnedDAO.save(returned);
        orderedDAO.deleteById(ordered.getId());
        return ResultFactory.buildSuccessResult(bid);
    }

    @GetMapping(value="/api/orderedBooks/{uid}")
    public Result orderedBooks(@PathVariable Integer uid){
        List<Ordered> ord = orderedDAO.findByUid(uid);
        List<Book> books = new ArrayList<>();
        for (Ordered bid: ord
             ) {
            books.add(bookDAO.findBookById(bid.getBid()));
        }
        /*System.out.println(books);*/
        return ResultFactory.buildSuccessResult(books);
    }

}
