package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.TagDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TagIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TagIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TagIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private TagDataOnDemand TagIntegrationTest.dod;
    
    @Test
    public void TagIntegrationTest.testCountTags() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", dod.getRandomTag());
        long count = com.prospringhibernate.gallery.domain.Tag.countTags();
        org.junit.Assert.assertTrue("Counter for 'Tag' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TagIntegrationTest.testFindTag() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", dod.getRandomTag());
        java.lang.Long id = dod.getRandomTag().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Tag obj = com.prospringhibernate.gallery.domain.Tag.findTag(id);
        org.junit.Assert.assertNotNull("Find method for 'Tag' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Tag' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TagIntegrationTest.testFindAllTags() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", dod.getRandomTag());
        long count = com.prospringhibernate.gallery.domain.Tag.countTags();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Tag', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.prospringhibernate.gallery.domain.Tag> result = com.prospringhibernate.gallery.domain.Tag.findAllTags();
        org.junit.Assert.assertNotNull("Find all method for 'Tag' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Tag' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TagIntegrationTest.testFindTagEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", dod.getRandomTag());
        long count = com.prospringhibernate.gallery.domain.Tag.countTags();
        if (count > 20) count = 20;
        java.util.List<com.prospringhibernate.gallery.domain.Tag> result = com.prospringhibernate.gallery.domain.Tag.findTagEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Tag' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Tag' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void TagIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", dod.getRandomTag());
        java.lang.Long id = dod.getRandomTag().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Tag obj = com.prospringhibernate.gallery.domain.Tag.findTag(id);
        org.junit.Assert.assertNotNull("Find method for 'Tag' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTag(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Tag' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void TagIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", dod.getRandomTag());
        java.lang.Long id = dod.getRandomTag().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Tag obj = com.prospringhibernate.gallery.domain.Tag.findTag(id);
        org.junit.Assert.assertNotNull("Find method for 'Tag' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTag(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Tag' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void TagIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", dod.getRandomTag());
        com.prospringhibernate.gallery.domain.Tag obj = dod.getNewTransientTag(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Tag' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Tag' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void TagIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to initialize correctly", dod.getRandomTag());
        java.lang.Long id = dod.getRandomTag().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tag' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Tag obj = com.prospringhibernate.gallery.domain.Tag.findTag(id);
        org.junit.Assert.assertNotNull("Find method for 'Tag' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Tag' with identifier '" + id + "'", com.prospringhibernate.gallery.domain.Tag.findTag(id));
    }
    
}
