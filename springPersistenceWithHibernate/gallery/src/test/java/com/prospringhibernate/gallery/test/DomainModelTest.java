package com.prospringhibernate.gallery.test;

import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.prospringhibernate.gallery.dao.PersonDao;
import com.prospringhibernate.gallery.domain.Person;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/spring/spring-master.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
@Transactional()
public class DomainModelTest {

    protected static Log log = LogFactory.getLog(DomainModelTest.class);


    PersonDao personDao;

    public PersonDao getPersonDao() {
        return personDao;
    }

    @Autowired
    public void setPersonDao(PersonDao personDao) {
        this.personDao = personDao;
    }

    @Test
    public void testPerson() {
        Person person = new Person();
        person.setFirstName("Paul");
        person.setLastName("Fisher");
        person.setUsername("pfisher");
        person.setPassword("password");
        person.setRoleLevel(Person.RoleLevel.ADMIN.getLevel());
        person.setVersion(1);
        personDao.save(person);

        final List<Person> people = personDao.getAll();
        Assert.assertEquals(1, people.size());

        try {
            Assert.assertEquals(people.get(0), personDao.authenticatePerson("pfisher", "password"));
        } catch (Exception e) {
            Assert.fail(e.getMessage());
        }

        try {
            personDao.authenticatePerson("pfisher", "badpassword");
            Assert.fail("bad password should fail");
        } catch (Exception e) {
             // success, we expect an authentication exception to be propagated
            log.debug("authentication exception thrown as expected, due to passing of invalid username and password");
        }
    }

}
