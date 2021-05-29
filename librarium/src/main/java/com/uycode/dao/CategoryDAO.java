package com.uycode.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uycode.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, Integer> {

}
