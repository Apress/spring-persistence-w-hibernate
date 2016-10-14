package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtDataGallery;
import java.lang.Long;
import java.lang.SuppressWarnings;
import java.util.List;

privileged aspect ArtDataGallery_Roo_Entity {
    
    public static long ArtDataGallery.countArtDataGallerys() {
        return ((Number) entityManager().createQuery("select count(o) from ArtDataGallery o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<ArtDataGallery> ArtDataGallery.findAllArtDataGallerys() {
        return entityManager().createQuery("select o from ArtDataGallery o").getResultList();
    }
    
    public static ArtDataGallery ArtDataGallery.findArtDataGallery(Long id) {
        if (id == null) return null;
        return entityManager().find(ArtDataGallery.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<ArtDataGallery> ArtDataGallery.findArtDataGalleryEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ArtDataGallery o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
