package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtEntity;
import java.lang.String;
import java.util.Date;

privileged aspect Comment_Roo_JavaBean {
    
    public String Comment.getComment() {
        return this.comment;
    }
    
    public void Comment.setComment(String comment) {
        this.comment = comment;
    }
    
    public Date Comment.getCreateDate() {
        return this.createDate;
    }
    
    public void Comment.setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public ArtEntity Comment.getArtEntity() {
        return this.artEntity;
    }
    
    public void Comment.setArtEntity(ArtEntity artEntity) {
        this.artEntity = artEntity;
    }
    
}
