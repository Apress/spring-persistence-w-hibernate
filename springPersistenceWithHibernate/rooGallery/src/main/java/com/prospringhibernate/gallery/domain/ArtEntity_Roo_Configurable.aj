package com.prospringhibernate.gallery.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect ArtEntity_Roo_Configurable {
    
    declare @type: ArtEntity: @Configurable;
    
}
