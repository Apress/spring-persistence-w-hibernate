package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtDataStorageDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArtDataStorageIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ArtDataStorageIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ArtDataStorageIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ArtDataStorageDataOnDemand ArtDataStorageIntegrationTest.dod;
    
    @Test
    public void ArtDataStorageIntegrationTest.testCountArtDataStorages() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to initialize correctly", dod.getRandomArtDataStorage());
        long count = com.prospringhibernate.gallery.domain.ArtDataStorage.countArtDataStorages();
        org.junit.Assert.assertTrue("Counter for 'ArtDataStorage' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ArtDataStorageIntegrationTest.testFindArtDataStorage() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to initialize correctly", dod.getRandomArtDataStorage());
        java.lang.Long id = dod.getRandomArtDataStorage().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtDataStorage obj = com.prospringhibernate.gallery.domain.ArtDataStorage.findArtDataStorage(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtDataStorage' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ArtDataStorage' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ArtDataStorageIntegrationTest.testFindAllArtDataStorages() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to initialize correctly", dod.getRandomArtDataStorage());
        long count = com.prospringhibernate.gallery.domain.ArtDataStorage.countArtDataStorages();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ArtDataStorage', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.prospringhibernate.gallery.domain.ArtDataStorage> result = com.prospringhibernate.gallery.domain.ArtDataStorage.findAllArtDataStorages();
        org.junit.Assert.assertNotNull("Find all method for 'ArtDataStorage' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ArtDataStorage' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ArtDataStorageIntegrationTest.testFindArtDataStorageEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to initialize correctly", dod.getRandomArtDataStorage());
        long count = com.prospringhibernate.gallery.domain.ArtDataStorage.countArtDataStorages();
        if (count > 20) count = 20;
        java.util.List<com.prospringhibernate.gallery.domain.ArtDataStorage> result = com.prospringhibernate.gallery.domain.ArtDataStorage.findArtDataStorageEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ArtDataStorage' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ArtDataStorage' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ArtDataStorageIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to initialize correctly", dod.getRandomArtDataStorage());
        java.lang.Long id = dod.getRandomArtDataStorage().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtDataStorage obj = com.prospringhibernate.gallery.domain.ArtDataStorage.findArtDataStorage(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtDataStorage' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArtDataStorage(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ArtDataStorage' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ArtDataStorageIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to initialize correctly", dod.getRandomArtDataStorage());
        java.lang.Long id = dod.getRandomArtDataStorage().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtDataStorage obj = com.prospringhibernate.gallery.domain.ArtDataStorage.findArtDataStorage(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtDataStorage' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArtDataStorage(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ArtDataStorage' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ArtDataStorageIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to initialize correctly", dod.getRandomArtDataStorage());
        com.prospringhibernate.gallery.domain.ArtDataStorage obj = dod.getNewTransientArtDataStorage(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ArtDataStorage' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ArtDataStorage' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void ArtDataStorageIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to initialize correctly", dod.getRandomArtDataStorage());
        java.lang.Long id = dod.getRandomArtDataStorage().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtDataStorage' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtDataStorage obj = com.prospringhibernate.gallery.domain.ArtDataStorage.findArtDataStorage(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtDataStorage' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'ArtDataStorage' with identifier '" + id + "'", com.prospringhibernate.gallery.domain.ArtDataStorage.findArtDataStorage(id));
    }
    
}
