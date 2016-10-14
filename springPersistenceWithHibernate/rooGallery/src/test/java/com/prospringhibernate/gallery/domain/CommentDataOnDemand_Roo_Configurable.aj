package com.prospringhibernate.gallery.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect CommentDataOnDemand_Roo_Configurable {
    
    declare @type: CommentDataOnDemand: @Configurable;
    
}
