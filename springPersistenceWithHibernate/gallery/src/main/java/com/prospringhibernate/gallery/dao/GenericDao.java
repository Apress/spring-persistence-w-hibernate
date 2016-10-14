package com.prospringhibernate.gallery.dao;

import java.util.List;

import com.prospringhibernate.gallery.domain.DomainObject;

public interface GenericDao<T extends DomainObject> {

    public T get(Long id);

    public List<T> getAll();

    public void save(T object);

    public void delete(T object);

    public void indexEntity(T object);

    public void indexAllItems();

}
