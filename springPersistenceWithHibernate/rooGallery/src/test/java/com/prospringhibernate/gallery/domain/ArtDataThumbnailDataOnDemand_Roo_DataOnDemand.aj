package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtDataThumbnail;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArtDataThumbnailDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ArtDataThumbnailDataOnDemand: @Component;
    
    private Random ArtDataThumbnailDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<ArtDataThumbnail> ArtDataThumbnailDataOnDemand.data;
    
    public ArtDataThumbnail ArtDataThumbnailDataOnDemand.getNewTransientArtDataThumbnail(int index) {
        com.prospringhibernate.gallery.domain.ArtDataThumbnail obj = new com.prospringhibernate.gallery.domain.ArtDataThumbnail();
        obj.setCreateDate(new java.util.Date());
        obj.setFile(null);
        return obj;
    }
    
    public ArtDataThumbnail ArtDataThumbnailDataOnDemand.getSpecificArtDataThumbnail(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ArtDataThumbnail obj = data.get(index);
        return ArtDataThumbnail.findArtDataThumbnail(obj.getId());
    }
    
    public ArtDataThumbnail ArtDataThumbnailDataOnDemand.getRandomArtDataThumbnail() {
        init();
        ArtDataThumbnail obj = data.get(rnd.nextInt(data.size()));
        return ArtDataThumbnail.findArtDataThumbnail(obj.getId());
    }
    
    public boolean ArtDataThumbnailDataOnDemand.modifyArtDataThumbnail(ArtDataThumbnail obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ArtDataThumbnailDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = com.prospringhibernate.gallery.domain.ArtDataThumbnail.findArtDataThumbnailEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ArtDataThumbnail' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<com.prospringhibernate.gallery.domain.ArtDataThumbnail>();
        for (int i = 0; i < 10; i++) {
            com.prospringhibernate.gallery.domain.ArtDataThumbnail obj = getNewTransientArtDataThumbnail(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
