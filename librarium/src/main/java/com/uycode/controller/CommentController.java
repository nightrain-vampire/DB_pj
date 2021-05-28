package com.uycode.controller;

import com.uycode.dao.CommentDAO;
import com.uycode.entity.Comment;
import com.uycode.result.Result;
import com.uycode.result.ResultFactory;
import com.uycode.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CommentController {
    @Autowired
    CommentService commentService;
    @Autowired
    CommentDAO commentDAO;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @PostMapping("api/admin/comment")
    public Result saveComment(@RequestBody Comment comment) {
        if(commentService.addOrUpdate(comment)) {
            return ResultFactory.buildSuccessResult("发布成功");
        }
        return ResultFactory.buildFailResult("参数错误，评论失败");
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @GetMapping("/api/comment/{size}/{page}")
    public Result listComments(@PathVariable("size") int size, @PathVariable("page") int page) {
        return ResultFactory.buildSuccessResult(commentService.list(page-1,size));
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @GetMapping("/api/comment/{id}")
    public Result getOneComment(@PathVariable("id") int id) {
        return ResultFactory.buildSuccessResult(commentService.findById(id));
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @DeleteMapping("/api/admin/content/comment/{id}")
    public Result deleteComment(@PathVariable("id") int id) {
        if(commentService.delete(id)){
            return ResultFactory.buildSuccessResult("删除成功！");
        }
        return ResultFactory.buildFailResult("操作错误，删除失败");
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @DeleteMapping("api/admin/comment/{id}")
    public Result deleteSingleComment(@PathVariable("id") int id) {
        if(commentService.delete(id)) {
            return ResultFactory.buildSuccessResult("删除成功!");
        }
        return ResultFactory.buildFailResult("操作错误,删除失败");
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @GetMapping("api/mycomment/{uid}")
    public Result loadComments(@PathVariable Integer uid){
        List<Comment> comme = commentDAO.findByUid(uid);
        return ResultFactory.buildSuccessResult(comme);
    }
}
