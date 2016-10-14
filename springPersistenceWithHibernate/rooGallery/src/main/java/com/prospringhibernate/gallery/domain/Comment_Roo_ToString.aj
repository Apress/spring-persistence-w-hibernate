package com.prospringhibernate.gallery.domain;

import java.lang.String;

privileged aspect Comment_Roo_ToString {
    
    public String Comment.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Comment: ").append(getComment()).append(", ");
        sb.append("CreateDate: ").append(getCreateDate()).append(", ");
        sb.append("ArtEntity: ").append(getArtEntity());
        return sb.toString();
    }
    
}
