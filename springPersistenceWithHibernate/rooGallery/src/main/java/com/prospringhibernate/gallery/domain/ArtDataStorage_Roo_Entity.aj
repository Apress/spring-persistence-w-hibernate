package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtDataStorage;
import java.lang.Long;
import java.lang.SuppressWarnings;
import java.util.List;

privileged aspect ArtDataStorage_Roo_Entity {
    
    public static long ArtDataStorage.countArtDataStorages() {
        return ((Number) entityManager().createQuery("select count(o) from ArtDataStorage o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<ArtDataStorage> ArtDataStorage.findAllArtDataStorages() {
        return entityManager().createQuery("select o from ArtDataStorage o").getResultList();
    }
    
    public static ArtDataStorage ArtDataStorage.findArtDataStorage(Long id) {
        if (id == null) return null;
        return entityManager().find(ArtDataStorage.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<ArtDataStorage> ArtDataStorage.findArtDataStorageEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ArtDataStorage o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
