package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.Category;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CategoryDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CategoryDataOnDemand: @Component;
    
    private Random CategoryDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Category> CategoryDataOnDemand.data;
    
    public Category CategoryDataOnDemand.getNewTransientCategory(int index) {
        com.prospringhibernate.gallery.domain.Category obj = new com.prospringhibernate.gallery.domain.Category();
        obj.setCreateDate(new java.util.Date());
        obj.setDescription("description_" + index);
        obj.setName("name_" + index);
        return obj;
    }
    
    public Category CategoryDataOnDemand.getSpecificCategory(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Category obj = data.get(index);
        return Category.findCategory(obj.getId());
    }
    
    public Category CategoryDataOnDemand.getRandomCategory() {
        init();
        Category obj = data.get(rnd.nextInt(data.size()));
        return Category.findCategory(obj.getId());
    }
    
    public boolean CategoryDataOnDemand.modifyCategory(Category obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CategoryDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = com.prospringhibernate.gallery.domain.Category.findCategoryEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Category' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<com.prospringhibernate.gallery.domain.Category>();
        for (int i = 0; i < 10; i++) {
            com.prospringhibernate.gallery.domain.Category obj = getNewTransientCategory(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
