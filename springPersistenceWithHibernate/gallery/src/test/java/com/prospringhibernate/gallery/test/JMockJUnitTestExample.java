package com.prospringhibernate.gallery.test;

import com.prospringhibernate.gallery.domain.Person;
import com.prospringhibernate.gallery.exception.AuthenticationException;
import com.prospringhibernate.gallery.service.ArtworkFacade;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JMock;
import org.jmock.integration.junit4.JUnit4Mockery;

@RunWith(JMock.class)
public class JMockJUnitTestExample {

    Mockery context = new JUnit4Mockery();

    private Person person;
    private ArtworkFacade artworkService;

    @Before
    public void initializeTest() {
        person = new Person();
        person.setUsername("username");
        person.setPassword("goodpassword");

        // here we use jMock to create a mock based on our Interface
        artworkService = context.mock(ArtworkFacade.class);
    }

    @Test
    public void testAuthenticationSuccess() throws AuthenticationException {
        // define expectations for authenticatePerson method
        context.checking(new Expectations() {

            {
                allowing(artworkService).authenticatePerson("username", "goodpassword");
                will(returnValue(person));
            }
        });
        artworkService.authenticatePerson("username", "goodpassword");
    }

    @Test(expected = AuthenticationException.class)
    public void testAuthenticationFailure() throws AuthenticationException {
        // define expectations, assuming a bad username/password
        context.checking(new Expectations() {

            {
                allowing(artworkService).authenticatePerson("username", "badpassword");
                will(throwException(new AuthenticationException()));
            }
        });
        artworkService.authenticatePerson("username", "badpassword");
    }

}
