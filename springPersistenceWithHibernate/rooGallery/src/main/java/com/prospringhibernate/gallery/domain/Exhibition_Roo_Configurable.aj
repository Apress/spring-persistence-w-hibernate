package com.prospringhibernate.gallery.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Exhibition_Roo_Configurable {
    
    declare @type: Exhibition: @Configurable;
    
}
