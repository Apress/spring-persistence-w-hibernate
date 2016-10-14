package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtDataGalleryDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArtDataGalleryIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ArtDataGalleryIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ArtDataGalleryIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ArtDataGalleryDataOnDemand ArtDataGalleryIntegrationTest.dod;
    
    @Test
    public void ArtDataGalleryIntegrationTest.testCountArtDataGallerys() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to initialize correctly", dod.getRandomArtDataGallery());
        long count = com.prospringhibernate.gallery.domain.ArtDataGallery.countArtDataGallerys();
        org.junit.Assert.assertTrue("Counter for 'ArtDataGallery' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ArtDataGalleryIntegrationTest.testFindArtDataGallery() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to initialize correctly", dod.getRandomArtDataGallery());
        java.lang.Long id = dod.getRandomArtDataGallery().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtDataGallery obj = com.prospringhibernate.gallery.domain.ArtDataGallery.findArtDataGallery(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtDataGallery' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ArtDataGallery' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ArtDataGalleryIntegrationTest.testFindAllArtDataGallerys() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to initialize correctly", dod.getRandomArtDataGallery());
        long count = com.prospringhibernate.gallery.domain.ArtDataGallery.countArtDataGallerys();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ArtDataGallery', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.prospringhibernate.gallery.domain.ArtDataGallery> result = com.prospringhibernate.gallery.domain.ArtDataGallery.findAllArtDataGallerys();
        org.junit.Assert.assertNotNull("Find all method for 'ArtDataGallery' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ArtDataGallery' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ArtDataGalleryIntegrationTest.testFindArtDataGalleryEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to initialize correctly", dod.getRandomArtDataGallery());
        long count = com.prospringhibernate.gallery.domain.ArtDataGallery.countArtDataGallerys();
        if (count > 20) count = 20;
        java.util.List<com.prospringhibernate.gallery.domain.ArtDataGallery> result = com.prospringhibernate.gallery.domain.ArtDataGallery.findArtDataGalleryEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ArtDataGallery' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ArtDataGallery' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ArtDataGalleryIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to initialize correctly", dod.getRandomArtDataGallery());
        java.lang.Long id = dod.getRandomArtDataGallery().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtDataGallery obj = com.prospringhibernate.gallery.domain.ArtDataGallery.findArtDataGallery(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtDataGallery' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArtDataGallery(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ArtDataGallery' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ArtDataGalleryIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to initialize correctly", dod.getRandomArtDataGallery());
        java.lang.Long id = dod.getRandomArtDataGallery().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtDataGallery obj = com.prospringhibernate.gallery.domain.ArtDataGallery.findArtDataGallery(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtDataGallery' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArtDataGallery(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ArtDataGallery' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ArtDataGalleryIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to initialize correctly", dod.getRandomArtDataGallery());
        com.prospringhibernate.gallery.domain.ArtDataGallery obj = dod.getNewTransientArtDataGallery(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ArtDataGallery' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ArtDataGallery' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void ArtDataGalleryIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to initialize correctly", dod.getRandomArtDataGallery());
        java.lang.Long id = dod.getRandomArtDataGallery().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataGallery' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtDataGallery obj = com.prospringhibernate.gallery.domain.ArtDataGallery.findArtDataGallery(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtDataGallery' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'ArtDataGallery' with identifier '" + id + "'", com.prospringhibernate.gallery.domain.ArtDataGallery.findArtDataGallery(id));
    }
    
}
