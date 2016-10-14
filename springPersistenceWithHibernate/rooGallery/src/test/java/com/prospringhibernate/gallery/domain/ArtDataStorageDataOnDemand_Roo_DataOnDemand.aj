package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtDataStorage;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArtDataStorageDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ArtDataStorageDataOnDemand: @Component;
    
    private Random ArtDataStorageDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<ArtDataStorage> ArtDataStorageDataOnDemand.data;
    
    public ArtDataStorage ArtDataStorageDataOnDemand.getNewTransientArtDataStorage(int index) {
        com.prospringhibernate.gallery.domain.ArtDataStorage obj = new com.prospringhibernate.gallery.domain.ArtDataStorage();
        obj.setCreateDate(new java.util.Date());
        obj.setFile(null);
        return obj;
    }
    
    public ArtDataStorage ArtDataStorageDataOnDemand.getSpecificArtDataStorage(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ArtDataStorage obj = data.get(index);
        return ArtDataStorage.findArtDataStorage(obj.getId());
    }
    
    public ArtDataStorage ArtDataStorageDataOnDemand.getRandomArtDataStorage() {
        init();
        ArtDataStorage obj = data.get(rnd.nextInt(data.size()));
        return ArtDataStorage.findArtDataStorage(obj.getId());
    }
    
    public boolean ArtDataStorageDataOnDemand.modifyArtDataStorage(ArtDataStorage obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ArtDataStorageDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = com.prospringhibernate.gallery.domain.ArtDataStorage.findArtDataStorageEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ArtDataStorage' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<com.prospringhibernate.gallery.domain.ArtDataStorage>();
        for (int i = 0; i < 10; i++) {
            com.prospringhibernate.gallery.domain.ArtDataStorage obj = getNewTransientArtDataStorage(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
