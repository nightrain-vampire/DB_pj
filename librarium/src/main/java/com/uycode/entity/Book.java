package com.uycode.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "book")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    /**
     * Title of the book.
     */
    private String title;

    /**
     * Author name.
     */
    private String author;

    /**
     * Publication date.
     */
    private String date;

    /**
     * Press.
     */
    private String press;

    /**
     * Abstract of the book.
     */
    private String abs;

    /**
     * The url of the book's cover.
     */
    private String cover;

    /**
     * The amount of the bool.
     */
    //private int amount;
    /**
     * Category id.
     */
    @ManyToOne
    @JoinColumn(name="cid")
    private Category category;
}
