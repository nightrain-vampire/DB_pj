package com.uycode.entity;

import javax.persistence.criteria.CriteriaBuilder;

public class CommentDetail {
    private Integer cid;
    private String username;
    private Integer uid;
    private String commentTitle;
    private String commentContentHtml;
    private String commentContentMd;
    private String commentTime;

    public CommentDetail(){}

    public CommentDetail(Integer cid, String username, Integer uid, String commentTitle, String commentContentHtml, String commentContentMd, String commentTime){
        this.cid = cid;
        this.username = username;
        this.uid = uid;
        this.commentTitle = commentTitle;
        this.commentContentHtml = commentContentHtml;
        this.commentContentMd = commentContentMd;
        this.commentTime = commentTime;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer id) {
        this.cid = cid;
    }

    public String getName() {
        return username;
    }

    public void setName(String username) {
        this.username = username;
    }

    public String getTitle() {
        return commentTitle;
    }

    public void setTitle(String commentTitle) {
        this.commentTitle = commentTitle;
    }

    public String getTime() {
        return commentTime;
    }

    public void setTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public Integer getUid() { return uid; }

    public void setUid() { this.uid = uid; }


}
