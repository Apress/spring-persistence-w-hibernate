package com.prospringhibernate.gallery.dto;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: paul
 * Date: Aug 9, 2010
 * Time: 11:10:57 PM
 * To change this template use File | Settings | File Templates.
 */

@XmlRootElement(name="category")
public class CategoryDTO {

    private Long id;
    private String categoryName;
    private String categoryDescription;
    private Set<ArtEntityDTO> artEntities;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public Set<ArtEntityDTO> getArtEntities() {
        return artEntities;
    }

    public void setArtEntities(Set<ArtEntityDTO> artEntities) {
        this.artEntities = artEntities;
    }
}
