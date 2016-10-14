package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.ArtEntity;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArtEntityDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ArtEntityDataOnDemand: @Component;
    
    private Random ArtEntityDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<ArtEntity> ArtEntityDataOnDemand.data;
    
    public ArtEntity ArtEntityDataOnDemand.getNewTransientArtEntity(int index) {
        com.prospringhibernate.gallery.domain.ArtEntity obj = new com.prospringhibernate.gallery.domain.ArtEntity();
        obj.setCaption("caption_" + index);
        obj.setCreateDate(new java.util.Date());
        obj.setDescription("description_" + index);
        obj.setDisplayDate(new java.util.Date());
        obj.setName("name_" + index);
        obj.setSubtitle("subtitle_" + index);
        obj.setTitle("title_" + index);
        return obj;
    }
    
    public ArtEntity ArtEntityDataOnDemand.getSpecificArtEntity(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        ArtEntity obj = data.get(index);
        return ArtEntity.findArtEntity(obj.getId());
    }
    
    public ArtEntity ArtEntityDataOnDemand.getRandomArtEntity() {
        init();
        ArtEntity obj = data.get(rnd.nextInt(data.size()));
        return ArtEntity.findArtEntity(obj.getId());
    }
    
    public boolean ArtEntityDataOnDemand.modifyArtEntity(ArtEntity obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ArtEntityDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = com.prospringhibernate.gallery.domain.ArtEntity.findArtEntityEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ArtEntity' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<com.prospringhibernate.gallery.domain.ArtEntity>();
        for (int i = 0; i < 10; i++) {
            com.prospringhibernate.gallery.domain.ArtEntity obj = getNewTransientArtEntity(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
