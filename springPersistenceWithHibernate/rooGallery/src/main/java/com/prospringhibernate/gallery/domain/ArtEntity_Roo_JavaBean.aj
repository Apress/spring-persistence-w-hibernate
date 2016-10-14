package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.Category;
import com.prospringhibernate.gallery.domain.Tag;
import java.lang.String;
import java.util.Date;
import java.util.Set;

privileged aspect ArtEntity_Roo_JavaBean {
    
    public String ArtEntity.getName() {
        return this.name;
    }
    
    public void ArtEntity.setName(String name) {
        this.name = name;
    }
    
    public String ArtEntity.getTitle() {
        return this.title;
    }
    
    public void ArtEntity.setTitle(String title) {
        this.title = title;
    }
    
    public String ArtEntity.getSubtitle() {
        return this.subtitle;
    }
    
    public void ArtEntity.setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }
    
    public String ArtEntity.getDescription() {
        return this.description;
    }
    
    public void ArtEntity.setDescription(String description) {
        this.description = description;
    }
    
    public String ArtEntity.getCaption() {
        return this.caption;
    }
    
    public void ArtEntity.setCaption(String caption) {
        this.caption = caption;
    }
    
    public Date ArtEntity.getCreateDate() {
        return this.createDate;
    }
    
    public void ArtEntity.setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public Date ArtEntity.getDisplayDate() {
        return this.displayDate;
    }
    
    public void ArtEntity.setDisplayDate(Date displayDate) {
        this.displayDate = displayDate;
    }
    
    public Set<Category> ArtEntity.getCategories() {
        return this.categories;
    }
    
    public void ArtEntity.setCategories(Set<Category> categories) {
        this.categories = categories;
    }
    
    public Set<Tag> ArtEntity.getTags() {
        return this.tags;
    }
    
    public void ArtEntity.setTags(Set<Tag> tags) {
        this.tags = tags;
    }
    
}
