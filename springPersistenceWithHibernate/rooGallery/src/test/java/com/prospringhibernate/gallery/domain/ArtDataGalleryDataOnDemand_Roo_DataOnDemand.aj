package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtDataGallery;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArtDataGalleryDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ArtDataGalleryDataOnDemand: @Component;
    
    private Random ArtDataGalleryDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<ArtDataGallery> ArtDataGalleryDataOnDemand.data;
    
    public ArtDataGallery ArtDataGalleryDataOnDemand.getNewTransientArtDataGallery(int index) {
        com.prospringhibernate.gallery.domain.ArtDataGallery obj = new com.prospringhibernate.gallery.domain.ArtDataGallery();
        obj.setCreateDate(new java.util.Date());
        obj.setFile(null);
        return obj;
    }
    
    public ArtDataGallery ArtDataGalleryDataOnDemand.getSpecificArtDataGallery(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ArtDataGallery obj = data.get(index);
        return ArtDataGallery.findArtDataGallery(obj.getId());
    }
    
    public ArtDataGallery ArtDataGalleryDataOnDemand.getRandomArtDataGallery() {
        init();
        ArtDataGallery obj = data.get(rnd.nextInt(data.size()));
        return ArtDataGallery.findArtDataGallery(obj.getId());
    }
    
    public boolean ArtDataGalleryDataOnDemand.modifyArtDataGallery(ArtDataGallery obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ArtDataGalleryDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = com.prospringhibernate.gallery.domain.ArtDataGallery.findArtDataGalleryEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ArtDataGallery' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<com.prospringhibernate.gallery.domain.ArtDataGallery>();
        for (int i = 0; i < 10; i++) {
            com.prospringhibernate.gallery.domain.ArtDataGallery obj = getNewTransientArtDataGallery(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
