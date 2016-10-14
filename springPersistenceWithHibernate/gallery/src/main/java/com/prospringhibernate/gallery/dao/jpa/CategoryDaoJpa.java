package com.prospringhibernate.gallery.dao.jpa;

import org.springframework.stereotype.Repository;

import com.prospringhibernate.gallery.dao.CategoryDao;
import com.prospringhibernate.gallery.domain.Category;

@Repository("categoryDao")
public class CategoryDaoJpa extends GenericDaoJpa<Category> implements CategoryDao {

    public CategoryDaoJpa() {
        super(Category.class);
    }
}
