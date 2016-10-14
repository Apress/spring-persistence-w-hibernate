package com.prospringhibernate.gallery.domain;

import java.lang.String;

privileged aspect Category_Roo_ToString {
    
    public String Category.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Description: ").append(getDescription()).append(", ");
        sb.append("CreateDate: ").append(getCreateDate()).append(", ");
        sb.append("ArtEntities: ").append(getArtEntities() == null ? "null" : getArtEntities().size());
        return sb.toString();
    }
    
}
