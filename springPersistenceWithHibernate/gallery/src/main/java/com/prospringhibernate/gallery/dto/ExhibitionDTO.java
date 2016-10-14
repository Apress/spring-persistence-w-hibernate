package com.prospringhibernate.gallery.dto;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: paul
 * Date: Aug 9, 2010
 * Time: 11:14:02 PM
 * To change this template use File | Settings | File Templates.
 */

@XmlRootElement(name="exhibition")
public class ExhibitionDTO {

    private Long id;
    private String exhibitionName;
    private Set<ArtEntityDTO> exhibitionArtWork = new HashSet<ArtEntityDTO>();


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getExhibitionName() {
        return exhibitionName;
    }

    public void setExhibitionName(String exhibitionName) {
        this.exhibitionName = exhibitionName;
    }

    public Set<ArtEntityDTO> getExhibitionArtWork() {
        return exhibitionArtWork;
    }

    public void setExhibitionArtWork(Set<ArtEntityDTO> exhibitionArtWork) {
        this.exhibitionArtWork = exhibitionArtWork;
    }
}
