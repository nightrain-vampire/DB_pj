package com.uycode.controller;


import com.uycode.dao.BookDAO;
import com.uycode.dao.OrderedDAO;
import com.uycode.dao.ReturnedDAO;
import com.uycode.entity.*;
import com.uycode.result.Result;
import com.uycode.result.ResultFactory;
import com.uycode.service.BookService;
import com.uycode.service.ReturnedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@RestController
public class RecordController {

    @Autowired
    OrderedDAO orderedDAO;

    @Autowired
    ReturnedDAO returnedDAO;

    @Autowired
    ReturnedService returnedService;

    @Autowired
    BookService bookService;

    @Autowired
    BookDAO bookDAO;


    @GetMapping("/api/getAllBorrowed")
    public Result getAllBorrowed(){
        return ResultFactory.buildSuccessResult(orderedDAO.list());
    }

    @GetMapping("/api/getAllReturned")
    public Result getAllReturned(){
        return ResultFactory.buildSuccessResult(returnedDAO.list());
    }


    @DeleteMapping("api/bookReturn1/{id}")
    public Result returnByAdmin(@PathVariable("id") Integer id) throws ParseException {
        Ordered ordered = orderedDAO.getOne(id);
        Returned returned = new Returned();
        returned.setUid(ordered.getUid());
        returned.setBid(ordered.getBid());
        LocalDateTime returnedTime = LocalDateTime.now();
         int year = returnedTime.getYear();
         int month = returnedTime.getMonthValue();
         int day = returnedTime.getDayOfMonth();
         int hour = returnedTime.getHour();
         int minute = returnedTime.getMinute();
         int seconds = returnedTime.getSecond();
         if(hour < 10)
             hour = '0' + hour;
        if(minute < 10)
            minute = '0' + minute;
        if(seconds < 10)
            seconds = '0' + seconds;
         String returnedTimeString = year +"年"+month+"月"+day+"  "+hour+":"+minute+":"+seconds;
        returned.setTime(returnedTimeString);
        returnedDAO.save(returned);
        orderedDAO.deleteById(ordered.getId());
        return ResultFactory.buildSuccessResult(id);
    }

    @DeleteMapping("/api/deleteReturned/{id}")
    public Result deleteReturned(@PathVariable("id") Integer id){
        returnedDAO.deleteById(id);
        return ResultFactory.buildSuccessResult(id);
    }

    @PostMapping("/api/multipleDelete")
    public Result multipleDelete(@RequestBody int[] arr){
        for (int i = 0; i < arr.length; i++) {
            returnedDAO.deleteById(arr[i]);
        }
        return ResultFactory.buildSuccessResult(arr);
    }

    @GetMapping("api/myreturned/{uid}")
    public Result loadReturned(@PathVariable Integer uid){
        /*List<Returned> returns = returnedDAO.findByUid(uid);
        List<Book> books = new ArrayList<>();
        for (Returned bid : returns
        ) {
            books.add(bookDAO.findBookById(bid.getBid()));
        }*/
        /*System.out.println(books);*/
        return ResultFactory.buildSuccessResult(returnedDAO.listbyuid(uid));
    }

}
