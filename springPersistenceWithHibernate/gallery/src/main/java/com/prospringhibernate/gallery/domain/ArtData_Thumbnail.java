package com.prospringhibernate.gallery.domain;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Transient;

@SuppressWarnings("serial")
@Entity
@DiscriminatorValue("THUMBNAIL")
public class ArtData_Thumbnail extends ArtData {

    public static final String BASE_URL = "/images/thumbnail/";

    public ArtData_Thumbnail(byte[] picture) {
        this.setPicture(picture);
    }

    public ArtData_Thumbnail() {
    }

        @Transient
    public String getUrl() {
        return BASE_URL + this.getId();
    }
}
