package com.prospringhibernate.gallery.dao.hibernate;

import org.springframework.stereotype.Repository;

import com.prospringhibernate.gallery.dao.ExhibitionDao;
import com.prospringhibernate.gallery.domain.Exhibition;

@Repository("exhibitionDao")
public class ExhibitionDaoHibernate extends GenericDaoHibernate<Exhibition> implements ExhibitionDao {

    public ExhibitionDaoHibernate() {
        super(Exhibition.class);
    }

}
