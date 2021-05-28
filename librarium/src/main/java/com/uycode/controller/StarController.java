package com.uycode.controller;

import com.uycode.dao.BookDAO;
import com.uycode.dao.StarredDAO;
import com.uycode.entity.Book;
import com.uycode.entity.Starred;
import com.uycode.result.Result;
import com.uycode.result.ResultFactory;
import com.uycode.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
public class StarController {
    @Autowired
    StarredDAO starredDAO;

    @Autowired
    BookService bookService;

    @Autowired
    BookDAO bookDAO;

    @PostMapping("/api/star")
    public Result setStar(@RequestBody Starred starred){
        Starred already = starredDAO.findByUidAndBid(starred.getUid(),starred.getBid());
        if(already != null) {
            return ResultFactory.buildFailResult("already");
        }
        starredDAO.save(starred);
        return ResultFactory.buildSuccessResult(starred);
    }

    @DeleteMapping("/api/starReturn/{uid}/{bid}")
    public Result cancelByUser(@PathVariable("uid") Integer uid,
                               @PathVariable("bid") Integer bid){
        Starred starred = starredDAO.findByUidAndBid(uid,bid);
        starredDAO.deleteById(starred.getId());
        return ResultFactory.buildSuccessResult(bid);
    }

    @GetMapping(value = "/api/starredBooks/{uid}")
    public Result starredBooks(@PathVariable Integer uid) {
        List<Starred> str = starredDAO.findByUid(uid);
        List<Book> books = new ArrayList<>();
        for (Starred bid : str){
            books.add(bookDAO.findBookById(bid.getBid()));
        }
        return ResultFactory.buildSuccessResult(books);
    }
}
