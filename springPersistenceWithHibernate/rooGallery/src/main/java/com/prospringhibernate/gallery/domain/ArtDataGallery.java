package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtData;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;

@Entity
@RooEntity
@RooJavaBean
@RooToString
@DiscriminatorValue("GALLERY")
public class ArtDataGallery extends ArtData {
}
