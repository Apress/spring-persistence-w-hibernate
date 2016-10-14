package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.Comment;
import java.lang.Integer;
import java.lang.Long;
import java.lang.SuppressWarnings;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Comment_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Comment.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Comment.id;
    
    @Version
    @Column(name = "version")
    private Integer Comment.version;
    
    public Long Comment.getId() {
        return this.id;
    }
    
    public void Comment.setId(Long id) {
        this.id = id;
    }
    
    public Integer Comment.getVersion() {
        return this.version;
    }
    
    public void Comment.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Comment.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Comment.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Comment attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Comment.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Comment Comment.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Comment merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Comment.entityManager() {
        EntityManager em = new Comment().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Comment.countComments() {
        return ((Number) entityManager().createQuery("select count(o) from Comment o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Comment> Comment.findAllComments() {
        return entityManager().createQuery("select o from Comment o").getResultList();
    }
    
    public static Comment Comment.findComment(Long id) {
        if (id == null) return null;
        return entityManager().find(Comment.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Comment> Comment.findCommentEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Comment o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
