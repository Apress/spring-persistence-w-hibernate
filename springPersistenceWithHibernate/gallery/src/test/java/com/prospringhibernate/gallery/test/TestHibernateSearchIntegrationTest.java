package com.prospringhibernate.gallery.test;

import java.util.Date;
import java.util.List;

import com.prospringhibernate.gallery.dao.ArtEntityDao;
import com.prospringhibernate.gallery.domain.ArtEntity;
import com.prospringhibernate.gallery.domain.Comment;
import com.prospringhibernate.gallery.service.ArtworkFacade;
import junit.framework.Assert;

import org.junit.After;
import org.junit.Test;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/spring/spring-master.xml"})
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional()
public class TestHibernateSearchIntegrationTest {

    ArtEntity artEntity;
    ArtEntityDao artEntityDao;
    ArtworkFacade artworkFacade;

    public ArtEntityDao getArtEntityDao() {
        return artEntityDao;
    }

    @Autowired
    public void setArtEntityDao(ArtEntityDao artEntityDao) {
        this.artEntityDao = artEntityDao;
    }

    @Autowired
    public void setArtworkFacade(ArtworkFacade artworkFacade) {
        this.artworkFacade = artworkFacade;
    }

    @Before
    public void preMethodSetup() {
        artEntity = new ArtEntity();
        artEntity.setCaption("caption test");
        Comment comment = new Comment();
        comment.setComment("This is a test comment. What a cool picture!");
        comment.setCommentDate(new Date());
        comment.setEmailAddress("test@prospringhibernate.com");
        comment.setFirstName("Paul");
        comment.setLastName("Fisher");
        comment.setTelephone("212-555-1212");
        artEntity.addCommentToArt(comment);
        artEntity.setDescription("A very cool picture of trees.");
        artEntity.setDisplayDate("October 10th");
        artEntity.setHeight(500);
        artEntity.setWidth(300);
        artEntity.setSubTitle("This is a subtitle for a picture");
        artEntity.setTitle("This is a title of a picture");
        artworkFacade.saveArtEntity(artEntity);
        artEntityDao.indexEntity(artEntity);
    }

    @After
    public void postMethodTearDown() {
        artEntityDao.delete(artEntity);
        artEntity = null;
    }

    @Test
    @Transactional(readOnly = false)
    public void testCreateArtEntity() {
        artEntity = new ArtEntity();
        artEntity.setCaption("caption test");
        Comment comment = new Comment();
        comment.setComment("This is a test comment. What a cool picture!");
        comment.setCommentDate(new Date());
        comment.setEmailAddress("test@prospringhibernate.com");
        comment.setFirstName("Paul");
        comment.setLastName("Fisher");
        comment.setTelephone("212-555-1212");
        artEntity.addCommentToArt(comment);
        artEntity.setDescription("A very cool picture of trees.");
        artEntity.setDisplayDate("October 10th");
        artEntity.setHeight(500);
        artEntity.setWidth(300);
        artEntity.setSubTitle("This is a subtitle for a picture");
        artEntity.setTitle("This is a title of a picture");
        artEntityDao.save(artEntity);
    }

    @Test
    public void testSimpleSearch() {
        final List<ArtEntity> artEntities = artEntityDao.searchForArtEntitiesByTerms("picture", 0, 20);
        Assert.assertTrue("at least one artEntity", artEntities.size() > 0);
    }

}
