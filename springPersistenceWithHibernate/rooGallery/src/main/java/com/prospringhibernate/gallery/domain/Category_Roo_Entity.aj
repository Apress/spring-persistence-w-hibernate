package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.Category;
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

privileged aspect Category_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Category.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Category.id;
    
    @Version
    @Column(name = "version")
    private Integer Category.version;
    
    public Long Category.getId() {
        return this.id;
    }
    
    public void Category.setId(Long id) {
        this.id = id;
    }
    
    public Integer Category.getVersion() {
        return this.version;
    }
    
    public void Category.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Category.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Category.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Category attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Category.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Category Category.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Category merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Category.entityManager() {
        EntityManager em = new Category().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Category.countCategorys() {
        return ((Number) entityManager().createQuery("select count(o) from Category o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Category> Category.findAllCategorys() {
        return entityManager().createQuery("select o from Category o").getResultList();
    }
    
    public static Category Category.findCategory(Long id) {
        if (id == null) return null;
        return entityManager().find(Category.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Category> Category.findCategoryEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Category o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
