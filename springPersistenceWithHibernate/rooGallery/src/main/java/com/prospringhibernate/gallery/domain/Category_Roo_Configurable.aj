package com.prospringhibernate.gallery.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Category_Roo_Configurable {
    
    declare @type: Category: @Configurable;
    
}
