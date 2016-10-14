package com.prospringhibernate.gallery.dao;

import org.springframework.dao.DataAccessException;

import com.prospringhibernate.gallery.domain.ArtData;
import com.prospringhibernate.gallery.domain.ArtEntity;

public interface ArtDataDao extends GenericDao<ArtData> {

    // gets (loading proxy) appropriate image format from artEntity (such as thumbnail, etc.)
    public ArtData getArtDataFromEntity(ArtEntity entity, String imageFormat) throws DataAccessException;
}
