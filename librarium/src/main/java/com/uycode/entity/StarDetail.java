package com.uycode.entity;

public class StarDetail {
    private Integer id;
    private String name;
    private String title;
    private String time;

    public StarDetail(){}

    public StarDetail(Integer id, String name, String title, String time){
        this.id = id;
        this.name = name;
        this.title = title;
        this.time = time;
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
}
