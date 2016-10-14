package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtDataThumbnailDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArtDataThumbnailIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ArtDataThumbnailIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ArtDataThumbnailIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ArtDataThumbnailDataOnDemand ArtDataThumbnailIntegrationTest.dod;
    
    @Test
    public void ArtDataThumbnailIntegrationTest.testCountArtDataThumbnails() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to initialize correctly", dod.getRandomArtDataThumbnail());
        long count = com.prospringhibernate.gallery.domain.ArtDataThumbnail.countArtDataThumbnails();
        org.junit.Assert.assertTrue("Counter for 'ArtDataThumbnail' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ArtDataThumbnailIntegrationTest.testFindArtDataThumbnail() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to initialize correctly", dod.getRandomArtDataThumbnail());
        java.lang.Long id = dod.getRandomArtDataThumbnail().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtDataThumbnail obj = com.prospringhibernate.gallery.domain.ArtDataThumbnail.findArtDataThumbnail(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtDataThumbnail' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ArtDataThumbnail' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ArtDataThumbnailIntegrationTest.testFindAllArtDataThumbnails() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to initialize correctly", dod.getRandomArtDataThumbnail());
        long count = com.prospringhibernate.gallery.domain.ArtDataThumbnail.countArtDataThumbnails();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ArtDataThumbnail', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.prospringhibernate.gallery.domain.ArtDataThumbnail> result = com.prospringhibernate.gallery.domain.ArtDataThumbnail.findAllArtDataThumbnails();
        org.junit.Assert.assertNotNull("Find all method for 'ArtDataThumbnail' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ArtDataThumbnail' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ArtDataThumbnailIntegrationTest.testFindArtDataThumbnailEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to initialize correctly", dod.getRandomArtDataThumbnail());
        long count = com.prospringhibernate.gallery.domain.ArtDataThumbnail.countArtDataThumbnails();
        if (count > 20) count = 20;
        java.util.List<com.prospringhibernate.gallery.domain.ArtDataThumbnail> result = com.prospringhibernate.gallery.domain.ArtDataThumbnail.findArtDataThumbnailEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ArtDataThumbnail' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ArtDataThumbnail' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ArtDataThumbnailIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to initialize correctly", dod.getRandomArtDataThumbnail());
        java.lang.Long id = dod.getRandomArtDataThumbnail().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtDataThumbnail obj = com.prospringhibernate.gallery.domain.ArtDataThumbnail.findArtDataThumbnail(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtDataThumbnail' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArtDataThumbnail(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ArtDataThumbnail' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ArtDataThumbnailIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to initialize correctly", dod.getRandomArtDataThumbnail());
        java.lang.Long id = dod.getRandomArtDataThumbnail().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtDataThumbnail obj = com.prospringhibernate.gallery.domain.ArtDataThumbnail.findArtDataThumbnail(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtDataThumbnail' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArtDataThumbnail(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ArtDataThumbnail' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ArtDataThumbnailIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to initialize correctly", dod.getRandomArtDataThumbnail());
        com.prospringhibernate.gallery.domain.ArtDataThumbnail obj = dod.getNewTransientArtDataThumbnail(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ArtDataThumbnail' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ArtDataThumbnail' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void ArtDataThumbnailIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to initialize correctly", dod.getRandomArtDataThumbnail());
        java.lang.Long id = dod.getRandomArtDataThumbnail().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataThumbnail' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtDataThumbnail obj = com.prospringhibernate.gallery.domain.ArtDataThumbnail.findArtDataThumbnail(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtDataThumbnail' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'ArtDataThumbnail' with identifier '" + id + "'", com.prospringhibernate.gallery.domain.ArtDataThumbnail.findArtDataThumbnail(id));
    }
    
}
