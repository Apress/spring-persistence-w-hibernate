package com.prospringhibernate.gallery.dao.hibernate;

import org.hibernate.proxy.HibernateProxy;
import org.springframework.stereotype.Repository;
import org.springframework.dao.DataAccessException;

import com.prospringhibernate.gallery.dao.ArtDataDao;
import com.prospringhibernate.gallery.domain.ArtData;
import com.prospringhibernate.gallery.domain.ArtEntity;

@Repository("artDataDao")
public class ArtDataDaoHibernate extends GenericDaoHibernate<ArtData> implements ArtDataDao {

    public ArtDataDaoHibernate() {
        super(ArtData.class);
    }

    private static final String STORAGE_FORMAT = "STORAGE_FORMAT";
    private static final String GALLERY_FORMAT = "GALLERY_FORMAT";
    private static final String THUMBNAIL_FORMAT = "THUMBNAIL_FORMAT";

    // gets (loading proxy) appropriate image format from artEntity (such as thumbnail, etc.)
    public ArtData getArtDataFromEntity(ArtEntity entity, String imageFormat) throws DataAccessException {
        if (imageFormat.equalsIgnoreCase(STORAGE_FORMAT)) {
            if (entity.getStoragePicture() instanceof HibernateProxy)
                this.getHibernateTemplate().initialize(entity.getStoragePicture());
            return entity.getStoragePicture();
        } else if (imageFormat.equalsIgnoreCase(GALLERY_FORMAT)) {
            if (entity.getGalleryPicture() instanceof HibernateProxy)
                this.getHibernateTemplate().initialize(entity.getGalleryPicture());
            return entity.getStoragePicture();
        } else if (imageFormat.equalsIgnoreCase(THUMBNAIL_FORMAT)) {
            if (entity.getThumbnailPicture() instanceof HibernateProxy)
                this.getHibernateTemplate().initialize(entity.getThumbnailPicture());
            return entity.getThumbnailPicture();
        }
        return null;
    }

}
