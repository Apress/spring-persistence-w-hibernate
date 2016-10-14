package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.Exhibition;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ExhibitionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ExhibitionDataOnDemand: @Component;
    
    private Random ExhibitionDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Exhibition> ExhibitionDataOnDemand.data;
    
    public Exhibition ExhibitionDataOnDemand.getNewTransientExhibition(int index) {
        com.prospringhibernate.gallery.domain.Exhibition obj = new com.prospringhibernate.gallery.domain.Exhibition();
        obj.setCreateDate(new java.util.Date());
        obj.setDescription("description_" + index);
        obj.setName("name_" + index);
        return obj;
    }
    
    public Exhibition ExhibitionDataOnDemand.getSpecificExhibition(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Exhibition obj = data.get(index);
        return Exhibition.findExhibition(obj.getId());
    }
    
    public Exhibition ExhibitionDataOnDemand.getRandomExhibition() {
        init();
        Exhibition obj = data.get(rnd.nextInt(data.size()));
        return Exhibition.findExhibition(obj.getId());
    }
    
    public boolean ExhibitionDataOnDemand.modifyExhibition(Exhibition obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ExhibitionDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = com.prospringhibernate.gallery.domain.Exhibition.findExhibitionEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Exhibition' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<com.prospringhibernate.gallery.domain.Exhibition>();
        for (int i = 0; i < 10; i++) {
            com.prospringhibernate.gallery.domain.Exhibition obj = getNewTransientExhibition(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
