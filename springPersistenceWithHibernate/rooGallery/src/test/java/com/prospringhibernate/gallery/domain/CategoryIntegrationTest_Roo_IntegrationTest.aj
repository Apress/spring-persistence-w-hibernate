package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.CategoryDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CategoryIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CategoryIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CategoryIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CategoryDataOnDemand CategoryIntegrationTest.dod;
    
    @Test
    public void CategoryIntegrationTest.testCountCategorys() {
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to initialize correctly", dod.getRandomCategory());
        long count = com.prospringhibernate.gallery.domain.Category.countCategorys();
        org.junit.Assert.assertTrue("Counter for 'Category' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CategoryIntegrationTest.testFindCategory() {
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to initialize correctly", dod.getRandomCategory());
        java.lang.Long id = dod.getRandomCategory().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Category obj = com.prospringhibernate.gallery.domain.Category.findCategory(id);
        org.junit.Assert.assertNotNull("Find method for 'Category' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Category' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CategoryIntegrationTest.testFindAllCategorys() {
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to initialize correctly", dod.getRandomCategory());
        long count = com.prospringhibernate.gallery.domain.Category.countCategorys();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Category', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.prospringhibernate.gallery.domain.Category> result = com.prospringhibernate.gallery.domain.Category.findAllCategorys();
        org.junit.Assert.assertNotNull("Find all method for 'Category' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Category' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CategoryIntegrationTest.testFindCategoryEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to initialize correctly", dod.getRandomCategory());
        long count = com.prospringhibernate.gallery.domain.Category.countCategorys();
        if (count > 20) count = 20;
        java.util.List<com.prospringhibernate.gallery.domain.Category> result = com.prospringhibernate.gallery.domain.Category.findCategoryEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Category' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Category' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CategoryIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to initialize correctly", dod.getRandomCategory());
        java.lang.Long id = dod.getRandomCategory().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Category obj = com.prospringhibernate.gallery.domain.Category.findCategory(id);
        org.junit.Assert.assertNotNull("Find method for 'Category' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCategory(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Category' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CategoryIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to initialize correctly", dod.getRandomCategory());
        java.lang.Long id = dod.getRandomCategory().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Category obj = com.prospringhibernate.gallery.domain.Category.findCategory(id);
        org.junit.Assert.assertNotNull("Find method for 'Category' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCategory(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Category' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CategoryIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to initialize correctly", dod.getRandomCategory());
        com.prospringhibernate.gallery.domain.Category obj = dod.getNewTransientCategory(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Category' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Category' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void CategoryIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to initialize correctly", dod.getRandomCategory());
        java.lang.Long id = dod.getRandomCategory().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Category' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Category obj = com.prospringhibernate.gallery.domain.Category.findCategory(id);
        org.junit.Assert.assertNotNull("Find method for 'Category' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Category' with identifier '" + id + "'", com.prospringhibernate.gallery.domain.Category.findCategory(id));
    }
    
}
