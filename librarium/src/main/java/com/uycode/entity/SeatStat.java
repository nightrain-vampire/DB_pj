package com.uycode.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "seat_stat")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class SeatStat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    private String name;

    @Column(name = "name_zh")
    private String nameZh;

}
