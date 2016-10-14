package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.RoleLevel;
import java.lang.String;
import java.util.Date;

privileged aspect Person_Roo_JavaBean {
    
    public String Person.getEmail() {
        return this.email;
    }
    
    public void Person.setEmail(String email) {
        this.email = email;
    }
    
    public String Person.getPassword() {
        return this.password;
    }
    
    public void Person.setPassword(String password) {
        this.password = password;
    }
    
    public String Person.getDisplayName() {
        return this.displayName;
    }
    
    public void Person.setDisplayName(String displayName) {
        this.displayName = displayName;
    }
    
    public Date Person.getCreateDate() {
        return this.createDate;
    }
    
    public void Person.setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public RoleLevel Person.getRoleLevel() {
        return this.roleLevel;
    }
    
    public void Person.setRoleLevel(RoleLevel roleLevel) {
        this.roleLevel = roleLevel;
    }
    
}
