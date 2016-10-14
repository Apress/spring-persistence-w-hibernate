package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtDataThumbnail;
import java.lang.Long;
import java.lang.SuppressWarnings;
import java.util.List;

privileged aspect ArtDataThumbnail_Roo_Entity {
    
    public static long ArtDataThumbnail.countArtDataThumbnails() {
        return ((Number) entityManager().createQuery("select count(o) from ArtDataThumbnail o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<ArtDataThumbnail> ArtDataThumbnail.findAllArtDataThumbnails() {
        return entityManager().createQuery("select o from ArtDataThumbnail o").getResultList();
    }
    
    public static ArtDataThumbnail ArtDataThumbnail.findArtDataThumbnail(Long id) {
        if (id == null) return null;
        return entityManager().find(ArtDataThumbnail.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<ArtDataThumbnail> ArtDataThumbnail.findArtDataThumbnailEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ArtDataThumbnail o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
