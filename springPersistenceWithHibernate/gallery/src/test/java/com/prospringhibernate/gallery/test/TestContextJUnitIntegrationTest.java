package com.prospringhibernate.gallery.test;

import java.util.List;

import junit.framework.Assert;

import org.junit.After;
import org.junit.Test;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.prospringhibernate.gallery.dao.PersonDao;
import com.prospringhibernate.gallery.domain.Person;
import com.prospringhibernate.gallery.exception.AuthenticationException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/spring/spring-master.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
@Transactional()
public class TestContextJUnitIntegrationTest {

    Person person;
    PersonDao personDao;

    public PersonDao getPersonDao() {
        return personDao;
    }

    @Autowired
    public void setPersonDao(PersonDao personDao) {
        this.personDao = personDao;
    }

    @Before
    public void preMethodSetup() {
        person = new Person();
        person.setFirstName("First");
        person.setLastName("Last");
        person.setUsername("username");
        person.setPassword("goodpassword");
        person.setRoleLevel(Person.RoleLevel.ADMIN.getLevel());
        person.setVersion(1);
        personDao.save(person);
    }

    @After
    public void postMethodTearDown() {
        personDao.delete(person);
        person = null;
    }

    @Test
    public void testPersonPersisted() {
        final List<Person> people = personDao.getAll();
        Assert.assertEquals(1, people.size());
    }

    @Test
    public void testAuthenticationSuccess() throws AuthenticationException {
        Person p = personDao.authenticatePerson("username", "goodpassword");
        Assert.assertNotNull(p);
    }

    @Test(expected = AuthenticationException.class)
    public void testAuthenticationFailure() throws AuthenticationException {
        personDao.authenticatePerson("username", "badpassword");
    }

}
