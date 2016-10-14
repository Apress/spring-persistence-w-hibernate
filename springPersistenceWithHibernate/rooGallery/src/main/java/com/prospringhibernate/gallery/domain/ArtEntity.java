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
public class ArtEntity {

    @NotNull
    @Size(max = 50)
    private String name;

    @NotNull
    @Size(max = 255)
    private String title;

    @NotNull
    @Size(max = 255)
    private String subtitle;

    @NotNull
    @Size(max = 255)
    private String description;

    @NotNull
    @Size(max = 255)
    private String caption;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date createDate;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date displayDate;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<com.prospringhibernate.gallery.domain.Category> categories = new java.util.HashSet<com.prospringhibernate.gallery.domain.Category>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<com.prospringhibernate.gallery.domain.Tag> tags = new java.util.HashSet<com.prospringhibernate.gallery.domain.Tag>();
}
