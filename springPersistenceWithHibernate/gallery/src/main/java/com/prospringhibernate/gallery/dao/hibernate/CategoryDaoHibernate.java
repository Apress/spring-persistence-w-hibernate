package com.prospringhibernate.gallery.dao.hibernate;

import org.springframework.stereotype.Repository;

import com.prospringhibernate.gallery.dao.CategoryDao;
import com.prospringhibernate.gallery.domain.Category;

@Repository("categoryDao")
public class CategoryDaoHibernate extends GenericDaoHibernate<Category> implements CategoryDao {

    public CategoryDaoHibernate() {
        super(Category.class);
    }

}
