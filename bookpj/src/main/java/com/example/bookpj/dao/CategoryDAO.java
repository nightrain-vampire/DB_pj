package com.example.bookpj.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.bookpj.pojo.Category;

public interface CategoryDAO extends JpaRepository<Category, Integer> {

}
