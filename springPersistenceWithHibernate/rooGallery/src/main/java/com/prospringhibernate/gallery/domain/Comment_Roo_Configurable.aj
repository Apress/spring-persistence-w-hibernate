package com.prospringhibernate.gallery.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Comment_Roo_Configurable {
    
    declare @type: Comment: @Configurable;
    
}
