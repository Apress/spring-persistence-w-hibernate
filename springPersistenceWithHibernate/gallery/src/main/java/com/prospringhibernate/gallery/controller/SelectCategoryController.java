package com.prospringhibernate.gallery.controller;

import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.prospringhibernate.gallery.domain.ArtEntity;
import com.prospringhibernate.gallery.domain.Category;

public class SelectCategoryController extends AbstractArtController {

    private static final String CATEGORY_ID = "CATEGORY_ID";

    @SuppressWarnings("unchecked")
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String catId = request.getParameter(CATEGORY_ID);
        if (catId == null || catId.length() <= 0)
            return new ModelAndView(this.getFormView());
        Long catId_L = Long.parseLong(catId);
        Category cat = this.getArtworkFacade().getCategory(catId_L);
        List<ArtEntity> artwork = this.getArtworkFacade().getArtworkInCategory(catId_L);
        ArtEntity selectedArt = null;
        if (artwork.size() > 0) {
            selectedArt = artwork.get(0);
        } else {
            // make fake selected art
            selectedArt = new ArtEntity();
            selectedArt.setId(0L);
            selectedArt.setTitle("No Artwork Available");
            selectedArt.setDescription("No Description Available");
        }

        Map model = this.getViewArtModelAndView(artwork, selectedArt, cat);

        // make sure referenced views have a hidden field with the category and other required reference data
        return new ModelAndView(this.getSuccessView(), "art", model);
    }

}
