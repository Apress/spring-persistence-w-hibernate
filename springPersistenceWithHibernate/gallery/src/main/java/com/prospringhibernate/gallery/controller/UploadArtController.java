package com.prospringhibernate.gallery.controller;

import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.Errors;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.prospringhibernate.gallery.domain.*;
import com.prospringhibernate.gallery.service.ArtworkFacade;
import com.prospringhibernate.gallery.converter.ImageHandler;
import com.prospringhibernate.gallery.converter.ArtDataMultipartFileEditor;

public class UploadArtController extends SimpleFormController {

    private ArtworkFacade artworkFacade;

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        Set<Category> selectedCategories = this.getSelectedCategories(request);
        ArtEntity artEntity = (ArtEntity) command;

        ImageHandler imageHandler = new ImageHandler();

        byte[] thumbnailData = imageHandler.convertToThumb(artEntity.getStoragePicture().getPicture());
        byte[] galleryData = imageHandler.convertToGallery(artEntity.getStoragePicture().getPicture());
        artEntity.setThumbnailPicture(new ArtData_Thumbnail(thumbnailData));
        artEntity.setGalleryPicture(new ArtData_Gallery(galleryData));
        this.getArtworkFacade().saveArtEntity(artEntity);
        for (Category category : selectedCategories) {
            category.addArtToCategory(artEntity);
            this.getArtworkFacade().saveCategory(category);
        }
        this.getArtworkFacade().saveArtEntity(artEntity);
        return new ModelAndView(this.getSuccessView());
    }

    private Set<Category> getSelectedCategories(HttpServletRequest request) {
        Set<Category> selectedCats = new HashSet<Category>();
        List<Category> availCats = this.getArtworkFacade().getCategories();
        for (Category curCat : availCats) {
            if (request.getParameterMap().containsKey(curCat.getCategoryName())) {
                // category has been selected
                selectedCats.add(curCat);
            }
        }
        return selectedCats;
    }

    @Override
    protected Map referenceData(HttpServletRequest request, Object command, Errors errors) throws Exception {
        // get Categories
        List<Category> categories = this.getArtworkFacade().getCategories();
        // get Exhibits
        List<Exhibition> exhibits = this.getArtworkFacade().getExhibitions();
        Map refData = new HashMap();
        refData.put("categories", categories);
        refData.put("exhibits", exhibits);
        return refData;
    }

    @Override
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        super.initBinder(request, binder); // To change body of overridden methods use File | Settings | File Templates.
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
        binder.registerCustomEditor(ArtData_Storage.class, new ArtDataMultipartFileEditor());
        DateFormat dateStyle = new SimpleDateFormat("MM/dd/yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateStyle, true));
    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        return super.formBackingObject(request); // To change body of overridden methods use File | Settings | File Templates.
    }

    public ArtworkFacade getArtworkFacade() {
        return artworkFacade;
    }

    public void setArtworkFacade(ArtworkFacade artworkFacade) {
        this.artworkFacade = artworkFacade;
    }

}
