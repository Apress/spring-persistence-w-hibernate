package com.prospringhibernate.gallery.dao.jpa;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.prospringhibernate.gallery.dao.PersonDao;
import com.prospringhibernate.gallery.domain.Person;
import com.prospringhibernate.gallery.exception.AuthenticationException;
import com.prospringhibernate.gallery.exception.EntityNotFoundException;

@Repository("personDao")
public class PersonDaoJpa extends GenericDaoJpa<Person> implements PersonDao {

    protected static Log log = LogFactory.getLog(PersonDaoJpa.class);

    public PersonDaoJpa() {
        super(Person.class);
    }

    public Person authenticatePerson(String username, String password) throws DataAccessException, AuthenticationException {
        String queryStr = "select people from Person people where people.username = :username and people.password = :password";
        Query query = entityManager.createQuery(queryStr);
        query.setParameter("username", username);
        query.setParameter("password", password);
        Person validUser = null;
        try {
            validUser = (Person) query.getSingleResult();
        } catch (NoResultException e) {
            log.error("No user found for username: " + username);
            throw new AuthenticationException("No users found");
        }
        return validUser;
    }

    public Person getPersonByUsername(String username) throws EntityNotFoundException {
        Query query = entityManager.createQuery("select people from Person people where people.username = :username");
        query.setParameter("username", username);
        Person person = null;
        try {
            person = (Person) query.getSingleResult();
        } catch (NoResultException e) {
            log.error("No user found for username: " + username);
            throw new EntityNotFoundException("Not person with username " + username + " found");
        }  
        return person;
    }

}
