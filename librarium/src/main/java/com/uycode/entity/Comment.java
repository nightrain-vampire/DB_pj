package com.uycode.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Date;

@Data
@Entity
@Table(name = "comment")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String username;
    private Integer uid;
    @Column(name = "comment_title")
    private String commentTitle;
    private String commentContentHtml;
    private String commentContentMd;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "time")
    private Date commentDate;
}
