package com.prospringhibernate.gallery.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Set;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Exhibition {

    @NotNull
    @Size(max = 150)
    private String name;

    @NotNull
    @Size(max = 2000)
    private String description;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date createDate;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<com.prospringhibernate.gallery.domain.ArtEntity> artEntities = new java.util.HashSet<com.prospringhibernate.gallery.domain.ArtEntity>();
}
