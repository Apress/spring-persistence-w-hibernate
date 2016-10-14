package com.prospringhibernate.gallery.domain;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Transient;

@SuppressWarnings("serial")
@Entity
@DiscriminatorValue("STORAGE")
public class ArtData_Storage extends ArtData {

    public static final String BASE_URL = "/images/storage/";

    public ArtData_Storage(byte[] picture) {
        this.setPicture(picture);
    }

    public ArtData_Storage() {

    }

    @Transient
    public String getUrl() {
        return BASE_URL + this.getId();
    }

}
