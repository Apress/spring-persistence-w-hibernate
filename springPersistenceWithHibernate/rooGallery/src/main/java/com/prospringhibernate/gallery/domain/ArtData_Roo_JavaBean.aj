package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtEntity;
import java.util.Date;
import java.util.Set;

privileged aspect ArtData_Roo_JavaBean {
    
    public Date ArtData.getCreateDate() {
        return this.createDate;
    }
    
    public void ArtData.setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public byte[] ArtData.getFile() {
        return this.file;
    }
    
    public void ArtData.setFile(byte[] file) {
        this.file = file;
    }
    
    public Set<ArtEntity> ArtData.getArtEntities() {
        return this.artEntities;
    }
    
    public void ArtData.setArtEntities(Set<ArtEntity> artEntities) {
        this.artEntities = artEntities;
    }
    
}
