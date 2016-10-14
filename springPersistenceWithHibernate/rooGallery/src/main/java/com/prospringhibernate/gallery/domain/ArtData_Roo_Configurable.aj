package com.prospringhibernate.gallery.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect ArtData_Roo_Configurable {
    
    declare @type: ArtData: @Configurable;
    
}
