package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtData;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArtDataDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ArtDataDataOnDemand: @Component;
    
    private Random ArtDataDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<ArtData> ArtDataDataOnDemand.data;
    
    public ArtData ArtDataDataOnDemand.getNewTransientArtData(int index) {
        com.prospringhibernate.gallery.domain.ArtData obj = new com.prospringhibernate.gallery.domain.ArtData();
        obj.setCreateDate(new java.util.Date());
        obj.setFile(null);
        return obj;
    }
    
    public ArtData ArtDataDataOnDemand.getSpecificArtData(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ArtData obj = data.get(index);
        return ArtData.findArtData(obj.getId());
    }
    
    public ArtData ArtDataDataOnDemand.getRandomArtData() {
        init();
        ArtData obj = data.get(rnd.nextInt(data.size()));
        return ArtData.findArtData(obj.getId());
    }
    
    public boolean ArtDataDataOnDemand.modifyArtData(ArtData obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ArtDataDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = com.prospringhibernate.gallery.domain.ArtData.findArtDataEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ArtData' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<com.prospringhibernate.gallery.domain.ArtData>();
        for (int i = 0; i < 10; i++) {
            com.prospringhibernate.gallery.domain.ArtData obj = getNewTransientArtData(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
