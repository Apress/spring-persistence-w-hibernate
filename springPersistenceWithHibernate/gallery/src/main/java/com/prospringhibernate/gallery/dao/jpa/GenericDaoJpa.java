package com.prospringhibernate.gallery.dao.jpa;

import java.util.List;
import java.util.Iterator;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.search.jpa.Search;
import org.hibernate.search.jpa.FullTextEntityManager;

import org.springframework.dao.DataAccessException;

import com.prospringhibernate.gallery.dao.GenericDao;
import com.prospringhibernate.gallery.domain.DomainObject;

@SuppressWarnings("unchecked")
public class GenericDaoJpa<T extends DomainObject> implements GenericDao<T> {

    private Class<T> type;

    protected EntityManager entityManager;

    public GenericDaoJpa(Class<T> type) {
        super();
        this.type = type;
    }

    @PersistenceContext
    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public T get(Long id) {
        return (T) entityManager.find(type, id);
    }

    public List<T> getAll() {
        return entityManager.createQuery("select obj from " + type.getName() + " obj").getResultList();
    }

    public void save(T object) throws DataAccessException {
        entityManager.persist(object);
    }

    public void delete(T object) throws DataAccessException {
        entityManager.remove(object);
    }

    public void indexEntity(T object) {
        FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(entityManager);
        fullTextEntityManager.index(object);
    }

    public void indexAllItems() {
        FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(entityManager);
        List results = fullTextEntityManager.createQuery("from " + type.getCanonicalName()).getResultList();
        int counter = 0, numItemsInGroup = 10;
        Iterator resultsIt = results.iterator();
        while (resultsIt.hasNext()) {
            fullTextEntityManager.index(resultsIt.next());
            if (counter++ % numItemsInGroup == 0) {
                fullTextEntityManager.flushToIndexes();
                fullTextEntityManager.clear();
            }
        }
    }

}
