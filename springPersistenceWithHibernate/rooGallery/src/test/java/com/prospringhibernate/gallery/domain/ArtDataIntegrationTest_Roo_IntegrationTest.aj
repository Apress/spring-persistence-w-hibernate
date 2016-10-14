package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtDataDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArtDataIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ArtDataIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ArtDataIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ArtDataDataOnDemand ArtDataIntegrationTest.dod;
    
    @Test
    public void ArtDataIntegrationTest.testCountArtDatas() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to initialize correctly", dod.getRandomArtData());
        long count = com.prospringhibernate.gallery.domain.ArtData.countArtDatas();
        org.junit.Assert.assertTrue("Counter for 'ArtData' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ArtDataIntegrationTest.testFindArtData() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to initialize correctly", dod.getRandomArtData());
        java.lang.Long id = dod.getRandomArtData().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtData obj = com.prospringhibernate.gallery.domain.ArtData.findArtData(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtData' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ArtData' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ArtDataIntegrationTest.testFindAllArtDatas() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to initialize correctly", dod.getRandomArtData());
        long count = com.prospringhibernate.gallery.domain.ArtData.countArtDatas();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ArtData', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.prospringhibernate.gallery.domain.ArtData> result = com.prospringhibernate.gallery.domain.ArtData.findAllArtDatas();
        org.junit.Assert.assertNotNull("Find all method for 'ArtData' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ArtData' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ArtDataIntegrationTest.testFindArtDataEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to initialize correctly", dod.getRandomArtData());
        long count = com.prospringhibernate.gallery.domain.ArtData.countArtDatas();
        if (count > 20) count = 20;
        java.util.List<com.prospringhibernate.gallery.domain.ArtData> result = com.prospringhibernate.gallery.domain.ArtData.findArtDataEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ArtData' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ArtData' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ArtDataIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to initialize correctly", dod.getRandomArtData());
        java.lang.Long id = dod.getRandomArtData().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtData obj = com.prospringhibernate.gallery.domain.ArtData.findArtData(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtData' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArtData(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ArtData' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ArtDataIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to initialize correctly", dod.getRandomArtData());
        java.lang.Long id = dod.getRandomArtData().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtData obj = com.prospringhibernate.gallery.domain.ArtData.findArtData(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtData' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArtData(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ArtData' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ArtDataIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to initialize correctly", dod.getRandomArtData());
        com.prospringhibernate.gallery.domain.ArtData obj = dod.getNewTransientArtData(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ArtData' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ArtData' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void ArtDataIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to initialize correctly", dod.getRandomArtData());
        java.lang.Long id = dod.getRandomArtData().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtData' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtData obj = com.prospringhibernate.gallery.domain.ArtData.findArtData(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtData' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'ArtData' with identifier '" + id + "'", com.prospringhibernate.gallery.domain.ArtData.findArtData(id));
    }
    
}
