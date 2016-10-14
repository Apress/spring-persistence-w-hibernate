package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.Tag;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TagDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TagDataOnDemand: @Component;
    
    private Random TagDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Tag> TagDataOnDemand.data;
    
    public Tag TagDataOnDemand.getNewTransientTag(int index) {
        com.prospringhibernate.gallery.domain.Tag obj = new com.prospringhibernate.gallery.domain.Tag();
        obj.setCreateDate(new java.util.Date());
        obj.setDescription("description_" + index);
        obj.setName("name_" + index);
        return obj;
    }
    
    public Tag TagDataOnDemand.getSpecificTag(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Tag obj = data.get(index);
        return Tag.findTag(obj.getId());
    }
    
    public Tag TagDataOnDemand.getRandomTag() {
        init();
        Tag obj = data.get(rnd.nextInt(data.size()));
        return Tag.findTag(obj.getId());
    }
    
    public boolean TagDataOnDemand.modifyTag(Tag obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void TagDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = com.prospringhibernate.gallery.domain.Tag.findTagEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Tag' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<com.prospringhibernate.gallery.domain.Tag>();
        for (int i = 0; i < 10; i++) {
            com.prospringhibernate.gallery.domain.Tag obj = getNewTransientTag(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
