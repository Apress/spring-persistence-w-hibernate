package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtEntity;
import java.lang.String;
import java.util.Date;
import java.util.Set;

privileged aspect Exhibition_Roo_JavaBean {
    
    public String Exhibition.getName() {
        return this.name;
    }
    
    public void Exhibition.setName(String name) {
        this.name = name;
    }
    
    public String Exhibition.getDescription() {
        return this.description;
    }
    
    public void Exhibition.setDescription(String description) {
        this.description = description;
    }
    
    public Date Exhibition.getCreateDate() {
        return this.createDate;
    }
    
    public void Exhibition.setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public Set<ArtEntity> Exhibition.getArtEntities() {
        return this.artEntities;
    }
    
    public void Exhibition.setArtEntities(Set<ArtEntity> artEntities) {
        this.artEntities = artEntities;
    }
    
}
