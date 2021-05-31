package com.uycode.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "returned")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Returned {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    /* @OneToOne
     @JoinColumn(name = "uid")*/
    private  Integer uid;

    /*@OneToOne
    @JoinColumn(name = "bid")*/
   // @Column(name="bid")
    private Integer bid;

    // @Column(name="time")
    private String time;

    private String duetime;




}
