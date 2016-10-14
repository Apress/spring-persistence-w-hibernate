package com.prospringhibernate.gallery.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.prospringhibernate.gallery.dao.PersonDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/spring/spring-master.xml" })
public class PersonDaoTest {

    @Autowired
    PersonDao personDao;

    @Test
    public void testPerson() {
        // insert test logic here
    }
}
