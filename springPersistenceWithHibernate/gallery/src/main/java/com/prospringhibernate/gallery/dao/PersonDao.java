package com.prospringhibernate.gallery.dao;

import com.prospringhibernate.gallery.domain.Person;
import com.prospringhibernate.gallery.exception.AuthenticationException;
import com.prospringhibernate.gallery.exception.EntityNotFoundException;

public interface PersonDao extends GenericDao<Person> {

    public Person getPersonByUsername(String username) throws EntityNotFoundException;

    public Person authenticatePerson(String username, String password) throws AuthenticationException;

}
