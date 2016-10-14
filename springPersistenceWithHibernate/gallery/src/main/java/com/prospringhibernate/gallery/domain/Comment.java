package com.prospringhibernate.gallery.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;

import org.hibernate.search.annotations.*;

@SuppressWarnings("serial")
@Entity
@Indexed
public class Comment implements DomainObject {

    private Long id;
    private String comment;
    private ArtEntity commentedArt;
    private Date commentDate;
    private String firstName;
    private String lastName;
    private String emailAddress;
    private String telephone;

    private Integer version;

    public Comment() {
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

    @Field(index = Index.TOKENIZED, store = Store.NO)
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @IndexedEmbedded
    @ManyToOne()
    public ArtEntity getCommentedArt() {
        return commentedArt;
    }

    public void setCommentedArt(ArtEntity commentedArt) {
        this.commentedArt = commentedArt;
    }

    @Temporal(value = TemporalType.DATE)
    @Field(index = Index.UN_TOKENIZED, store = Store.YES)
    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    @Field(index = Index.UN_TOKENIZED, store = Store.YES)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Field(index = Index.UN_TOKENIZED, store = Store.YES)
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Field(index = Index.UN_TOKENIZED, store = Store.YES)
    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    @Field(index = Index.UN_TOKENIZED, store = Store.YES)
    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @Version
    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

}
