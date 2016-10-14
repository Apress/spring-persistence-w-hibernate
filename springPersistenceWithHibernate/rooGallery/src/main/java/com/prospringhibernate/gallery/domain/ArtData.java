package com.prospringhibernate.gallery.domain;

import java.util.Date;
import java.util.Set;

import javax.persistence.Lob;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.ManyToMany;
import javax.persistence.Inheritance;
import javax.persistence.CascadeType;
import javax.persistence.TemporalType;
import javax.persistence.InheritanceType;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.DiscriminatorColumn;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@RooJavaBean
@RooToString
@RooEntity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(discriminatorType = DiscriminatorType.STRING)
@DiscriminatorValue("GENERIC")
public class ArtData {

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date createDate;

    @Lob
    @Basic(fetch=javax.persistence.FetchType.LAZY)
    private byte[] file;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<com.prospringhibernate.gallery.domain.ArtEntity> artEntities = new java.util.HashSet<com.prospringhibernate.gallery.domain.ArtEntity>();

}

