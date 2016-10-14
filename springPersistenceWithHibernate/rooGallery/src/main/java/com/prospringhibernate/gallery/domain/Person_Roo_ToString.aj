package com.prospringhibernate.gallery.domain;

import java.lang.String;

privileged aspect Person_Roo_ToString {
    
    public String Person.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Email: ").append(getEmail()).append(", ");
        sb.append("Password: ").append(getPassword()).append(", ");
        sb.append("DisplayName: ").append(getDisplayName()).append(", ");
        sb.append("CreateDate: ").append(getCreateDate()).append(", ");
        sb.append("RoleLevel: ").append(getRoleLevel());
        return sb.toString();
    }
    
}
