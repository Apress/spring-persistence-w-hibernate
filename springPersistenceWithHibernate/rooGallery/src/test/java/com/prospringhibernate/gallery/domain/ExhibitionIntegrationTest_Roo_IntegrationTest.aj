package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ExhibitionDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ExhibitionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ExhibitionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ExhibitionIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ExhibitionDataOnDemand ExhibitionIntegrationTest.dod;
    
    @Test
    public void ExhibitionIntegrationTest.testCountExhibitions() {
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to initialize correctly", dod.getRandomExhibition());
        long count = com.prospringhibernate.gallery.domain.Exhibition.countExhibitions();
        org.junit.Assert.assertTrue("Counter for 'Exhibition' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ExhibitionIntegrationTest.testFindExhibition() {
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to initialize correctly", dod.getRandomExhibition());
        java.lang.Long id = dod.getRandomExhibition().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Exhibition obj = com.prospringhibernate.gallery.domain.Exhibition.findExhibition(id);
        org.junit.Assert.assertNotNull("Find method for 'Exhibition' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Exhibition' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ExhibitionIntegrationTest.testFindAllExhibitions() {
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to initialize correctly", dod.getRandomExhibition());
        long count = com.prospringhibernate.gallery.domain.Exhibition.countExhibitions();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Exhibition', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.prospringhibernate.gallery.domain.Exhibition> result = com.prospringhibernate.gallery.domain.Exhibition.findAllExhibitions();
        org.junit.Assert.assertNotNull("Find all method for 'Exhibition' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Exhibition' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ExhibitionIntegrationTest.testFindExhibitionEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to initialize correctly", dod.getRandomExhibition());
        long count = com.prospringhibernate.gallery.domain.Exhibition.countExhibitions();
        if (count > 20) count = 20;
        java.util.List<com.prospringhibernate.gallery.domain.Exhibition> result = com.prospringhibernate.gallery.domain.Exhibition.findExhibitionEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Exhibition' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Exhibition' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ExhibitionIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to initialize correctly", dod.getRandomExhibition());
        java.lang.Long id = dod.getRandomExhibition().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Exhibition obj = com.prospringhibernate.gallery.domain.Exhibition.findExhibition(id);
        org.junit.Assert.assertNotNull("Find method for 'Exhibition' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyExhibition(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Exhibition' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ExhibitionIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to initialize correctly", dod.getRandomExhibition());
        java.lang.Long id = dod.getRandomExhibition().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Exhibition obj = com.prospringhibernate.gallery.domain.Exhibition.findExhibition(id);
        org.junit.Assert.assertNotNull("Find method for 'Exhibition' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyExhibition(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Exhibition' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ExhibitionIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to initialize correctly", dod.getRandomExhibition());
        com.prospringhibernate.gallery.domain.Exhibition obj = dod.getNewTransientExhibition(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Exhibition' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Exhibition' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void ExhibitionIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to initialize correctly", dod.getRandomExhibition());
        java.lang.Long id = dod.getRandomExhibition().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Exhibition' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Exhibition obj = com.prospringhibernate.gallery.domain.Exhibition.findExhibition(id);
        org.junit.Assert.assertNotNull("Find method for 'Exhibition' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Exhibition' with identifier '" + id + "'", com.prospringhibernate.gallery.domain.Exhibition.findExhibition(id));
    }
    
}
