package com.prospringhibernate.gallery.test;

import java.util.Date;

import org.dozer.Mapper;

import org.junit.Test;
import org.junit.Assert;
import org.junit.Before;
import org.junit.runner.RunWith;

import com.prospringhibernate.gallery.domain.Comment;
import com.prospringhibernate.gallery.domain.ArtEntity;
import com.prospringhibernate.gallery.dto.ArtEntityDTO;
import com.prospringhibernate.gallery.domain.ArtData_Thumbnail;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/spring/spring-master.xml"})
public class DozerMappingTest {

    private Mapper dozerMapper;
    private ArtEntity artEntity;

    public Mapper getDozerMapper() {
        return dozerMapper;
    }

    @Autowired
    public void setDozerMapper(Mapper dozerMapper) {
        this.dozerMapper = dozerMapper;
    }

    @Before
    public void preMethodSetup() {

        Comment comment = new Comment();
        comment.setComment("This is a test comment. What a cool picture!");
        comment.setCommentDate(new Date());
        comment.setEmailAddress("test@prospringhibernate.com");
        comment.setFirstName("John");
        comment.setLastName("Doe");
        comment.setTelephone("212-555-5555");

        ArtData_Thumbnail thumbnail = new ArtData_Thumbnail();
        thumbnail.setId(1L);

        artEntity = new ArtEntity();
        artEntity.setCaption("caption test");
        artEntity.addCommentToArt(comment);
        artEntity.setDescription("A very cool picture of trees.");
        artEntity.setDisplayDate("October 10th");
        artEntity.setHeight(500);
        artEntity.setWidth(300);
        artEntity.setSubTitle("This is a subtitle for a picture");
        artEntity.setTitle("This is a title of a picture");
        artEntity.setThumbnailPicture(thumbnail);

    }


    @Test
    public void testMappingArtEntity() {
        ArtEntityDTO artEntityDTO = this.getDozerMapper().map(artEntity, ArtEntityDTO.class);
        Assert.assertEquals(artEntity.getTitle(), artEntityDTO.getTitle());
        Assert.assertTrue(artEntityDTO.getComments().size() > 0);
        Assert.assertTrue("artData_thumbnail should be a string value", artEntityDTO.getThumbnailURL().length() > 0);
    }

}
