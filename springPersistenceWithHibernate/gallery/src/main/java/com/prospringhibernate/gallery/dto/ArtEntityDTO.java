package com.prospringhibernate.gallery.dto;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "artEntity")
public class ArtEntityDTO {

    private Long id;
    private String title;
    private String subTitle;
    private Date uploadedDate;
    private String displayDate;
    private Integer width;
    private Integer height;
    private String media;
    private String description;
    private String caption;
    private String galleryURL;
    private String storageURL;
    private String thumbnailURL;
    private Boolean isGeneralViewable;
    private Boolean isPrivilegeViewable; // can be seen by logged-in non-administrators (spcial visitors)
    private Set<CommentDTO> comments = new HashSet<CommentDTO>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public Date getUploadedDate() {
        return uploadedDate;
    }

    public void setUploadedDate(Date uploadedDate) {
        this.uploadedDate = uploadedDate;
    }

    public String getDisplayDate() {
        return displayDate;
    }

    public void setDisplayDate(String displayDate) {
        this.displayDate = displayDate;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public String getGalleryURL() {
        return galleryURL;
    }

    public void setGalleryURL(String galleryURL) {
        this.galleryURL = galleryURL;
    }

    public String getStorageURL() {
        return storageURL;
    }

    public void setStorageURL(String storageURL) {
        this.storageURL = storageURL;
    }

    public String getThumbnailURL() {
        return thumbnailURL;
    }

    public void setThumbnailURL(String thumbnailURL) {
        this.thumbnailURL = thumbnailURL;
    }

    public Boolean getGeneralViewable() {
        return isGeneralViewable;
    }

    public void setGeneralViewable(Boolean generalViewable) {
        isGeneralViewable = generalViewable;
    }

    public Boolean getPrivilegeViewable() {
        return isPrivilegeViewable;
    }

    public void setPrivilegeViewable(Boolean privilegeViewable) {
        isPrivilegeViewable = privilegeViewable;
    }

    public Set<CommentDTO> getComments() {
        return comments;
    }

    public void setComments(Set<CommentDTO> comments) {
        this.comments = comments;
    }

}
