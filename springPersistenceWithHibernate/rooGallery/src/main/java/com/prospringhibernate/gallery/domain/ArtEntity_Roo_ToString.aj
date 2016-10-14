package com.prospringhibernate.gallery.domain;

import java.lang.String;

privileged aspect ArtEntity_Roo_ToString {
    
    public String ArtEntity.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Title: ").append(getTitle()).append(", ");
        sb.append("Subtitle: ").append(getSubtitle()).append(", ");
        sb.append("Description: ").append(getDescription()).append(", ");
        sb.append("Caption: ").append(getCaption()).append(", ");
        sb.append("CreateDate: ").append(getCreateDate()).append(", ");
        sb.append("DisplayDate: ").append(getDisplayDate()).append(", ");
        sb.append("Categories: ").append(getCategories() == null ? "null" : getCategories().size()).append(", ");
        sb.append("Tags: ").append(getTags() == null ? "null" : getTags().size());
        return sb.toString();
    }
    
}
