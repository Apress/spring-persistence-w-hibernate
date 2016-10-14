package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.PersonDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PersonIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PersonIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PersonIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private PersonDataOnDemand PersonIntegrationTest.dod;
    
    @Test
    public void PersonIntegrationTest.testCountPeople() {
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", dod.getRandomPerson());
        long count = com.prospringhibernate.gallery.domain.Person.countPeople();
        org.junit.Assert.assertTrue("Counter for 'Person' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PersonIntegrationTest.testFindPerson() {
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", dod.getRandomPerson());
        java.lang.Long id = dod.getRandomPerson().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Person obj = com.prospringhibernate.gallery.domain.Person.findPerson(id);
        org.junit.Assert.assertNotNull("Find method for 'Person' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Person' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PersonIntegrationTest.testFindAllPeople() {
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", dod.getRandomPerson());
        long count = com.prospringhibernate.gallery.domain.Person.countPeople();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Person', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.prospringhibernate.gallery.domain.Person> result = com.prospringhibernate.gallery.domain.Person.findAllPeople();
        org.junit.Assert.assertNotNull("Find all method for 'Person' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Person' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PersonIntegrationTest.testFindPersonEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", dod.getRandomPerson());
        long count = com.prospringhibernate.gallery.domain.Person.countPeople();
        if (count > 20) count = 20;
        java.util.List<com.prospringhibernate.gallery.domain.Person> result = com.prospringhibernate.gallery.domain.Person.findPersonEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Person' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Person' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void PersonIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", dod.getRandomPerson());
        java.lang.Long id = dod.getRandomPerson().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Person obj = com.prospringhibernate.gallery.domain.Person.findPerson(id);
        org.junit.Assert.assertNotNull("Find method for 'Person' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPerson(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Person' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void PersonIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", dod.getRandomPerson());
        java.lang.Long id = dod.getRandomPerson().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Person obj = com.prospringhibernate.gallery.domain.Person.findPerson(id);
        org.junit.Assert.assertNotNull("Find method for 'Person' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPerson(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Person' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void PersonIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", dod.getRandomPerson());
        com.prospringhibernate.gallery.domain.Person obj = dod.getNewTransientPerson(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Person' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Person' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void PersonIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to initialize correctly", dod.getRandomPerson());
        java.lang.Long id = dod.getRandomPerson().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Person' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Person obj = com.prospringhibernate.gallery.domain.Person.findPerson(id);
        org.junit.Assert.assertNotNull("Find method for 'Person' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Person' with identifier '" + id + "'", com.prospringhibernate.gallery.domain.Person.findPerson(id));
    }
    
}
