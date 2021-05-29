package com.uycode.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "starred")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Starred {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    /* @OneToOne
    @JoinColumn(name = "uid")*/
    private  Integer uid;

    /*@OneToOne
    @JoinColumn(name = "bid")*/

    private Integer bid;

    private String time;
}