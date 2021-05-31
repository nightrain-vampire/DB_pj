package com.uycode.controller;

import com.uycode.entity.JotterArticle;
import com.uycode.result.Result;
import com.uycode.result.ResultFactory;
import com.uycode.service.JotterArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

@RestController
public class JotterController {
    @Autowired
    JotterArticleService jotterArticleService;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @PostMapping("api/admin/content/article")
    public Result saveArticle(@RequestBody JotterArticle article) {
        if(jotterArticleService.addOrUpdate(article)) {
            return ResultFactory.buildSuccessResult("保存成功");
        }
        return ResultFactory.buildFailResult("参数错误，保存失败");
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @GetMapping("/api/article/{size}/{page}")
    public Result listArticles(@PathVariable("size") int size, @PathVariable("page") int page) {
        return ResultFactory.buildSuccessResult(jotterArticleService.list(page - 1, size));
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @GetMapping("/api/article/{id}")
    public Result getOneArticle(@PathVariable("id") int id) {
        return ResultFactory.buildSuccessResult(jotterArticleService.findById(id));
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @DeleteMapping("/api/admin/content/article/{id}")
    public Result deleteArticle(@PathVariable("id") int id) {
        if(jotterArticleService.delete(id)) {
            return ResultFactory.buildSuccessResult("删除成功");
        }
        return ResultFactory.buildFailResult("参数错误，删除失败");
    }

}
