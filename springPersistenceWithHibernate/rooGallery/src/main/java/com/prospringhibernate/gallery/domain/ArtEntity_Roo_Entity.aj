package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtEntity;
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

privileged aspect ArtEntity_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ArtEntity.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ArtEntity.id;
    
    @Version
    @Column(name = "version")
    private Integer ArtEntity.version;
    
    public Long ArtEntity.getId() {
        return this.id;
    }
    
    public void ArtEntity.setId(Long id) {
        this.id = id;
    }
    
    public Integer ArtEntity.getVersion() {
        return this.version;
    }
    
    public void ArtEntity.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ArtEntity.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ArtEntity.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ArtEntity attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ArtEntity.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public ArtEntity ArtEntity.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ArtEntity merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager ArtEntity.entityManager() {
        EntityManager em = new ArtEntity().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ArtEntity.countArtEntitys() {
        return ((Number) entityManager().createQuery("select count(o) from ArtEntity o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<ArtEntity> ArtEntity.findAllArtEntitys() {
        return entityManager().createQuery("select o from ArtEntity o").getResultList();
    }
    
    public static ArtEntity ArtEntity.findArtEntity(Long id) {
        if (id == null) return null;
        return entityManager().find(ArtEntity.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<ArtEntity> ArtEntity.findArtEntityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ArtEntity o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
