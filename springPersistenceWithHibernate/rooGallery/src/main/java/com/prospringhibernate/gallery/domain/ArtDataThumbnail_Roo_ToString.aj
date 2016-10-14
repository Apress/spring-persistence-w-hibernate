package com.prospringhibernate.gallery.domain;

import java.lang.String;

privileged aspect ArtDataThumbnail_Roo_ToString {
    
    public String ArtDataThumbnail.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("CreateDate: ").append(getCreateDate()).append(", ");
        sb.append("File: ").append(java.util.Arrays.toString(getFile())).append(", ");
        sb.append("ArtEntities: ").append(getArtEntities() == null ? "null" : getArtEntities().size());
        return sb.toString();
    }
    
}
