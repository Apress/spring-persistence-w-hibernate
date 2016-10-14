package com.prospringhibernate.gallery.dao.hibernate;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.prospringhibernate.gallery.dao.PersonDao;
import com.prospringhibernate.gallery.domain.Person;
import com.prospringhibernate.gallery.exception.AuthenticationException;
import com.prospringhibernate.gallery.exception.EntityNotFoundException;

@Repository("personDao")
@SuppressWarnings("unchecked")
public class PersonDaoHibernate extends GenericDaoHibernate<Person> implements PersonDao {

    public PersonDaoHibernate() {
        super(Person.class);
    }

    public Person authenticatePerson(String username, String password) throws DataAccessException, AuthenticationException {
        List<Person> validUsers = this.getHibernateTemplate().findByNamedParam("select people from Person people where people.username = :username and people.password = :password",
                new String[] { "username", "password" }, new String[] { username, password });
        if (validUsers == null || validUsers.size() <= 0)
            throw new AuthenticationException("No users found");
        return validUsers.get(0);
    }

    public Person getPersonByUsername(String username) throws DataAccessException, EntityNotFoundException {
        List<Person> people = this.getHibernateTemplate().findByNamedParam("select people from Person people where people.username = :username", "username", username);
        if (people == null || people.size() <= 0)
            throw new EntityNotFoundException("Not person with username " + username + " found");
        return people.get(0);
    }

}
