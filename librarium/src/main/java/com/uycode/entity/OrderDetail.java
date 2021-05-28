package com.uycode.entity;


import javax.persistence.criteria.CriteriaBuilder;

public class OrderDetail {
    private Integer id;
    private String name;
    private String title;
    private String time;
    private String duetime;

    public OrderDetail(){}

    public OrderDetail(Integer id, String name, String title, String time, String duetime){
        this.id = id;
        this.name = name;
        this.title = title;
        this.time = time;
        this.duetime = duetime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDuetime() { return duetime; }

    public void setDuetime(String duetime) { this.duetime = duetime; }


}
