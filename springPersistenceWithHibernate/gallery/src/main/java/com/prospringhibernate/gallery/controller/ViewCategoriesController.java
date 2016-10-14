package com.prospringhibernate.gallery.controller;

import java.util.Map;
import java.util.List;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.prospringhibernate.gallery.util.ViewUtil;
import com.prospringhibernate.gallery.domain.Category;
import com.prospringhibernate.gallery.service.ArtworkFacade;

public class ViewCategoriesController implements Controller {

    private ArtworkFacade artworkFacade;
    private String successView;

    @SuppressWarnings("unchecked")
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Category> categories = this.getArtworkFacade().getCategories();
        if (categories == null || categories.size() <= 0) {
            this.initCategories();
            categories = this.getArtworkFacade().getCategories();
        }
        Map model = new HashMap();
        model.put("categories", categories);
        model.put("posStyle", ViewUtil.buildAlternator(new String[] { "categoryleft", "categoryright" }, 6));
        return new ModelAndView(this.getSuccessView(), "art", model);
    }

    private void initCategories() {
        this.initCategory("Music", "Artwork involving Music");
        this.initCategory("Landscapes", "Landscapes");
        this.initCategory("Figures", "Figures");
        this.initCategory("Compositions and Collages", "Compositions and Collages");
        this.initCategory("Travel Sketches", "Travel Sketches");
        this.initCategory("Drawings", "Drawings");
    }

    private void initCategory(String name, String description) {
        Category cat = new Category();
        cat.setCategoryName(name);
        cat.setCategoryDescription(description);
        this.getArtworkFacade().saveCategory(cat);
    }

    public ArtworkFacade getArtworkFacade() {
        return artworkFacade;
    }

    public void setArtworkFacade(ArtworkFacade artworkFacade) {
        this.artworkFacade = artworkFacade;
    }

    public String getSuccessView() {
        return successView;
    }

    public void setSuccessView(String successView) {
        this.successView = successView;
    }

}
