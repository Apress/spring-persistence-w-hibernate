package com.prospringhibernate.gallery.dao.jpa;

import org.springframework.stereotype.Repository;
import org.springframework.dao.DataAccessException;

import com.prospringhibernate.gallery.dao.ArtDataDao;
import com.prospringhibernate.gallery.domain.ArtData;
import com.prospringhibernate.gallery.domain.ArtEntity;

@Repository("artDataDao")
public class ArtDataDaoJpa extends GenericDaoJpa<ArtData> implements ArtDataDao {

    public ArtDataDaoJpa() {
        super(ArtData.class);
    }

    private static final String STORAGE_FORMAT = "STORAGE_FORMAT";
    private static final String GALLERY_FORMAT = "GALLERY_FORMAT";
    private static final String THUMBNAIL_FORMAT = "THUMBNAIL_FORMAT";

    // gets (loading proxy) appropriate image format from artEntity (such as thumbnail, etc.)
    public ArtData getArtDataFromEntity(ArtEntity entity, String imageFormat) throws DataAccessException {
        if (imageFormat.equalsIgnoreCase(STORAGE_FORMAT)) {
            return entity.getStoragePicture();
        } else if (imageFormat.equalsIgnoreCase(GALLERY_FORMAT)) {
            return entity.getStoragePicture();
        } else if (imageFormat.equalsIgnoreCase(THUMBNAIL_FORMAT)) {
            return entity.getThumbnailPicture();
        }
        return null;
    }
}
