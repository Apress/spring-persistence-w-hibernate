package com.prospringhibernate.gallery.domain;

import org.springframework.roo.addon.test.RooIntegrationTest;
import com.prospringhibernate.gallery.domain.Person;
import org.junit.Test;

@RooIntegrationTest(entity = Person.class)
public class PersonIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
}
