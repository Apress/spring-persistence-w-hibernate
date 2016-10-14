package com.prospringhibernate.gallery.domain;

import java.util.Set;
import java.util.Date;
import java.util.HashSet;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Version;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import org.hibernate.search.annotations.Boost;
import org.hibernate.search.annotations.ContainedIn;
import org.hibernate.search.annotations.DateBridge;
import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Resolution;
import org.hibernate.search.annotations.Store;

@SuppressWarnings("serial")
@Entity
@Indexed
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class ArtEntity implements DomainObject {

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
    private ArtData_Gallery galleryPicture;
    private ArtData_Storage storagePicture;
    private ArtData_Thumbnail thumbnailPicture;
    private Boolean isGeneralViewable;
    private Boolean isPrivilegeViewable; // can be seen by logged-in non-administrators (spcial visitors)
    private Set<Category> categories = new HashSet<Category>();
    private Set<Comment> comments = new HashSet<Comment>();

    private Integer version;

    public ArtEntity() {
    }

    @Id
    @GeneratedValue
    @DocumentId
    public final Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn()
    public ArtData_Gallery getGalleryPicture() {
        return galleryPicture;
    }

    public void setGalleryPicture(ArtData_Gallery galleryPicture) {
        this.galleryPicture = galleryPicture;
    }

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn()
    public ArtData_Storage getStoragePicture() {
        return storagePicture;
    }

    public void setStoragePicture(ArtData_Storage storagePicture) {
        this.storagePicture = storagePicture;
    }

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn()
    public ArtData_Thumbnail getThumbnailPicture() {
        return thumbnailPicture;
    }

    public void setThumbnailPicture(ArtData_Thumbnail thumbnailPicture) {
        this.thumbnailPicture = thumbnailPicture;
    }

    @Field(index = Index.TOKENIZED, store=Store.YES)
    @Boost(2.0f)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Field(index = Index.TOKENIZED, store=Store.YES)
    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    @Field(index = Index.TOKENIZED, store=Store.NO)
    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }

    @Field(index = Index.UN_TOKENIZED, store=Store.YES)
    @DateBridge(resolution = Resolution.MINUTE)
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

    @Field(index = Index.UN_TOKENIZED, store=Store.YES)
    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    @Field(index = Index.UN_TOKENIZED, store=Store.YES)
    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    @Field(index = Index.TOKENIZED, store=Store.NO)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Field(index = Index.TOKENIZED, store=Store.NO)
    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
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

    @ContainedIn
    @ManyToMany(mappedBy = "artEntities")
    public Set<Category> getCategories() {
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }

    @ContainedIn
    @OneToMany(orphanRemoval = true, cascade = { javax.persistence.CascadeType.ALL })
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    @Version
    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public boolean addCommentToArt(Comment comment) {
        comment.setCommentedArt(this);
        return this.getComments().add(comment);
    }

    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        final ArtEntity artEntity = (ArtEntity) o;

        if (description != null ? !description.equals(artEntity.description) : artEntity.description != null)
            return false;
        if (displayDate != null ? !displayDate.equals(artEntity.displayDate) : artEntity.displayDate != null)
            return false;
        if (height != null ? !height.equals(artEntity.height) : artEntity.height != null)
            return false;
        if (subTitle != null ? !subTitle.equals(artEntity.subTitle) : artEntity.subTitle != null)
            return false;
        if (title != null ? !title.equals(artEntity.title) : artEntity.title != null)
            return false;
        if (uploadedDate != null ? !uploadedDate.equals(artEntity.uploadedDate) : artEntity.uploadedDate != null)
            return false;
        if (width != null ? !width.equals(artEntity.width) : artEntity.width != null)
            return false;

        return true;
    }

    public int hashCode() {
        int result;
        result = (title != null ? title.hashCode() : 0);
        result = 29 * result + (subTitle != null ? subTitle.hashCode() : 0);
        result = 29 * result + (uploadedDate != null ? uploadedDate.hashCode() : 0);
        result = 29 * result + (displayDate != null ? displayDate.hashCode() : 0);
        result = 29 * result + (width != null ? width.hashCode() : 0);
        result = 29 * result + (height != null ? height.hashCode() : 0);
        result = 29 * result + (description != null ? description.hashCode() : 0);
        return result;
    }

}
