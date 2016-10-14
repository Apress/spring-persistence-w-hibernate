package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.Exhibition;
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

privileged aspect Exhibition_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Exhibition.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Exhibition.id;
    
    @Version
    @Column(name = "version")
    private Integer Exhibition.version;
    
    public Long Exhibition.getId() {
        return this.id;
    }
    
    public void Exhibition.setId(Long id) {
        this.id = id;
    }
    
    public Integer Exhibition.getVersion() {
        return this.version;
    }
    
    public void Exhibition.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Exhibition.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Exhibition.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Exhibition attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Exhibition.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Exhibition Exhibition.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Exhibition merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Exhibition.entityManager() {
        EntityManager em = new Exhibition().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Exhibition.countExhibitions() {
        return ((Number) entityManager().createQuery("select count(o) from Exhibition o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Exhibition> Exhibition.findAllExhibitions() {
        return entityManager().createQuery("select o from Exhibition o").getResultList();
    }
    
    public static Exhibition Exhibition.findExhibition(Long id) {
        if (id == null) return null;
        return entityManager().find(Exhibition.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Exhibition> Exhibition.findExhibitionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Exhibition o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
