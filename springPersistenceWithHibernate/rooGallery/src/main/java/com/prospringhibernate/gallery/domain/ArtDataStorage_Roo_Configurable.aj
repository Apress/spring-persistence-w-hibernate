package com.prospringhibernate.gallery.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect ArtDataStorage_Roo_Configurable {
    
    declare @type: ArtDataStorage: @Configurable;
    
}
