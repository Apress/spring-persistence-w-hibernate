package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.CommentDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CommentIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CommentIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CommentIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CommentDataOnDemand CommentIntegrationTest.dod;
    
    @Test
    public void CommentIntegrationTest.testCountComments() {
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to initialize correctly", dod.getRandomComment());
        long count = com.prospringhibernate.gallery.domain.Comment.countComments();
        org.junit.Assert.assertTrue("Counter for 'Comment' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CommentIntegrationTest.testFindComment() {
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to initialize correctly", dod.getRandomComment());
        java.lang.Long id = dod.getRandomComment().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Comment obj = com.prospringhibernate.gallery.domain.Comment.findComment(id);
        org.junit.Assert.assertNotNull("Find method for 'Comment' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Comment' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CommentIntegrationTest.testFindAllComments() {
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to initialize correctly", dod.getRandomComment());
        long count = com.prospringhibernate.gallery.domain.Comment.countComments();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Comment', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.prospringhibernate.gallery.domain.Comment> result = com.prospringhibernate.gallery.domain.Comment.findAllComments();
        org.junit.Assert.assertNotNull("Find all method for 'Comment' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Comment' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CommentIntegrationTest.testFindCommentEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to initialize correctly", dod.getRandomComment());
        long count = com.prospringhibernate.gallery.domain.Comment.countComments();
        if (count > 20) count = 20;
        java.util.List<com.prospringhibernate.gallery.domain.Comment> result = com.prospringhibernate.gallery.domain.Comment.findCommentEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'Comment' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Comment' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CommentIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to initialize correctly", dod.getRandomComment());
        java.lang.Long id = dod.getRandomComment().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Comment obj = com.prospringhibernate.gallery.domain.Comment.findComment(id);
        org.junit.Assert.assertNotNull("Find method for 'Comment' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyComment(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Comment' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CommentIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to initialize correctly", dod.getRandomComment());
        java.lang.Long id = dod.getRandomComment().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Comment obj = com.prospringhibernate.gallery.domain.Comment.findComment(id);
        org.junit.Assert.assertNotNull("Find method for 'Comment' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyComment(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Comment' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CommentIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to initialize correctly", dod.getRandomComment());
        com.prospringhibernate.gallery.domain.Comment obj = dod.getNewTransientComment(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Comment' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Comment' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional
    public void CommentIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to initialize correctly", dod.getRandomComment());
        java.lang.Long id = dod.getRandomComment().getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Comment' failed to provide an identifier", id);
        com.prospringhibernate.gallery.domain.Comment obj = com.prospringhibernate.gallery.domain.Comment.findComment(id);
        org.junit.Assert.assertNotNull("Find method for 'Comment' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Comment' with identifier '" + id + "'", com.prospringhibernate.gallery.domain.Comment.findComment(id));
    }
    
}
