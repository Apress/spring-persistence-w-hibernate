package com.prospringhibernate.gallery.dao.jpa;

import org.springframework.stereotype.Repository;

import com.prospringhibernate.gallery.dao.ExhibitionDao;
import com.prospringhibernate.gallery.domain.Exhibition;

@Repository("exhibitionDao")
public class ExhibitionDaoJpa extends GenericDaoJpa<Exhibition> implements ExhibitionDao {

    public ExhibitionDaoJpa() {
        super(Exhibition.class);
    }
}
