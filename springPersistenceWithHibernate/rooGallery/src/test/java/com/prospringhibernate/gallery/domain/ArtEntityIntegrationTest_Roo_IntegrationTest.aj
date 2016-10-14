package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtEntityDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArtEntityIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ArtEntityIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ArtEntityIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private ArtEntityDataOnDemand ArtEntityIntegrationTest.dod;
    
    @Test
    public void ArtEntityIntegrationTest.testCountArtEntitys() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to initialize correctly", dod.getRandomArtEntity());
        long count = com.prospringhibernate.gallery.domain.ArtEntity.countArtEntitys();
        org.junit.Assert.assertTrue("Counter for 'ArtEntity' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ArtEntityIntegrationTest.testFindArtEntity() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to initialize correctly", dod.getRandomArtEntity());
        java.lang.Long id = dod.getRandomArtEntity().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtEntity obj = com.prospringhibernate.gallery.domain.ArtEntity.findArtEntity(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtEntity' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'ArtEntity' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ArtEntityIntegrationTest.testFindAllArtEntitys() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to initialize correctly", dod.getRandomArtEntity());
        long count = com.prospringhibernate.gallery.domain.ArtEntity.countArtEntitys();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'ArtEntity', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.prospringhibernate.gallery.domain.ArtEntity> result = com.prospringhibernate.gallery.domain.ArtEntity.findAllArtEntitys();
        org.junit.Assert.assertNotNull("Find all method for 'ArtEntity' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'ArtEntity' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ArtEntityIntegrationTest.testFindArtEntityEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to initialize correctly", dod.getRandomArtEntity());
        long count = com.prospringhibernate.gallery.domain.ArtEntity.countArtEntitys();
        if (count > 20) count = 20;
        java.util.List<com.prospringhibernate.gallery.domain.ArtEntity> result = com.prospringhibernate.gallery.domain.ArtEntity.findArtEntityEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'ArtEntity' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'ArtEntity' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void ArtEntityIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to initialize correctly", dod.getRandomArtEntity());
        java.lang.Long id = dod.getRandomArtEntity().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtEntity obj = com.prospringhibernate.gallery.domain.ArtEntity.findArtEntity(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtEntity' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArtEntity(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ArtEntity' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ArtEntityIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to initialize correctly", dod.getRandomArtEntity());
        java.lang.Long id = dod.getRandomArtEntity().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtEntity obj = com.prospringhibernate.gallery.domain.ArtEntity.findArtEntity(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtEntity' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArtEntity(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'ArtEntity' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void ArtEntityIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to initialize correctly", dod.getRandomArtEntity());
        com.prospringhibernate.gallery.domain.ArtEntity obj = dod.getNewTransientArtEntity(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'ArtEntity' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'ArtEntity' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void ArtEntityIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to initialize correctly", dod.getRandomArtEntity());
        java.lang.Long id = dod.getRandomArtEntity().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'ArtEntity' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.ArtEntity obj = com.prospringhibernate.gallery.domain.ArtEntity.findArtEntity(id);
        org.junit.Assert.assertNotNull("Find method for 'ArtEntity' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'ArtEntity' with identifier '" + id + "'", com.prospringhibernate.gallery.domain.ArtEntity.findArtEntity(id));
    }
    
}
