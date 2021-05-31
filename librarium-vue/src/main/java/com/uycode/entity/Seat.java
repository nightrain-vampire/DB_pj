package com.uycode.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "seat")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Seat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    private int sid;
    //private int state;

    @ManyToOne
    @JoinColumn(name = "state")
    private SeatStat seatStat;
}
