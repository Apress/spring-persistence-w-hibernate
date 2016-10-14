package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.Comment;
import java.util.List;
import java.util.Random;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CommentDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CommentDataOnDemand: @Component;
    
    private Random CommentDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Comment> CommentDataOnDemand.data;
    
    public Comment CommentDataOnDemand.getNewTransientComment(int index) {
        com.prospringhibernate.gallery.domain.Comment obj = new com.prospringhibernate.gallery.domain.Comment();
        obj.setArtEntity(null);
        obj.setComment("comment_" + index);
        obj.setCreateDate(new java.util.Date());
        return obj;
    }
    
    public Comment CommentDataOnDemand.getSpecificComment(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Comment obj = data.get(index);
        return Comment.findComment(obj.getId());
    }
    
    public Comment CommentDataOnDemand.getRandomComment() {
        init();
        Comment obj = data.get(rnd.nextInt(data.size()));
        return Comment.findComment(obj.getId());
    }
    
    public boolean CommentDataOnDemand.modifyComment(Comment obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void CommentDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = com.prospringhibernate.gallery.domain.Comment.findCommentEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Comment' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<com.prospringhibernate.gallery.domain.Comment>();
        for (int i = 0; i < 10; i++) {
            com.prospringhibernate.gallery.domain.Comment obj = getNewTransientComment(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
