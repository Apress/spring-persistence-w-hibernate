package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtEntity;
import java.lang.String;
import java.util.Date;
import java.util.Set;

privileged aspect Category_Roo_JavaBean {
    
    public String Category.getName() {
        return this.name;
    }
    
    public void Category.setName(String name) {
        this.name = name;
    }
    
    public String Category.getDescription() {
        return this.description;
    }
    
    public void Category.setDescription(String description) {
        this.description = description;
    }
    
    public Date Category.getCreateDate() {
        return this.createDate;
    }
    
    public void Category.setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public Set<ArtEntity> Category.getArtEntities() {
        return this.artEntities;
    }
    
    public void Category.setArtEntities(Set<ArtEntity> artEntities) {
        this.artEntities = artEntities;
    }
    
}
