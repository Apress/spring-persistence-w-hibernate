package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtData;
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

privileged aspect ArtData_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager ArtData.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ArtData.id;
    
    @Version
    @Column(name = "version")
    private Integer ArtData.version;
    
    public Long ArtData.getId() {
        return this.id;
    }
    
    public void ArtData.setId(Long id) {
        this.id = id;
    }
    
    public Integer ArtData.getVersion() {
        return this.version;
    }
    
    public void ArtData.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ArtData.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ArtData.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ArtData attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ArtData.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public ArtData ArtData.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ArtData merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager ArtData.entityManager() {
        EntityManager em = new ArtData().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ArtData.countArtDatas() {
        return ((Number) entityManager().createQuery("select count(o) from ArtData o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<ArtData> ArtData.findAllArtDatas() {
        return entityManager().createQuery("select o from ArtData o").getResultList();
    }
    
    public static ArtData ArtData.findArtData(Long id) {
        if (id == null) return null;
        return entityManager().find(ArtData.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<ArtData> ArtData.findArtDataEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ArtData o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
