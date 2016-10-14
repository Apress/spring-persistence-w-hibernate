package com.prospringhibernate.gallery.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.prospringhibernate.gallery.domain.RoleLevel;
import javax.persistence.Enumerated;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Person {

    @NotNull
    @Pattern(regexp = "[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}")
    private String email;

    @NotNull
    private String password;

    @NotNull
    @Size(min = 3, max = 15)
    private String displayName;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date createDate;

    @Enumerated
    private RoleLevel roleLevel;
}
