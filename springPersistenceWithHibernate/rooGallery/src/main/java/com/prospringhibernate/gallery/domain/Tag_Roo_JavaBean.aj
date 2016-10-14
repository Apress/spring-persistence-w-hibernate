package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtEntity;
import java.lang.String;
import java.util.Date;
import java.util.Set;

privileged aspect Tag_Roo_JavaBean {
    
    public String Tag.getName() {
        return this.name;
    }
    
    public void Tag.setName(String name) {
        this.name = name;
    }
    
    public String Tag.getDescription() {
        return this.description;
    }
    
    public void Tag.setDescription(String description) {
        this.description = description;
    }
    
    public Date Tag.getCreateDate() {
        return this.createDate;
    }
    
    public void Tag.setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public Set<ArtEntity> Tag.getArtEntities() {
        return this.artEntities;
    }
    
    public void Tag.setArtEntities(Set<ArtEntity> artEntities) {
        this.artEntities = artEntities;
    }
    
}
