package com.prospringhibernate.gallery.domain;

import javax.persistence.Entity;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Transient;

@SuppressWarnings("serial")
@Entity
@DiscriminatorValue("GALLERY")
public class ArtData_Gallery extends ArtData {

    public static final String BASE_URL = "/images/gallery/";

    public ArtData_Gallery(byte[] picture) {
        this.setPicture(picture);
    }

    public ArtData_Gallery() {

    }

    @Transient
    public String getUrl() {
        return BASE_URL + this.getId();
    }

}
