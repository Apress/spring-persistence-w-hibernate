package com.prospringhibernate.gallery.controller;

import java.util.Map;
import java.util.List;
import java.util.HashMap;

import org.springframework.web.servlet.mvc.AbstractController;

import com.prospringhibernate.gallery.domain.ArtEntity;
import com.prospringhibernate.gallery.domain.Category;
import com.prospringhibernate.gallery.service.ArtworkFacade;

public abstract class AbstractArtController extends AbstractController {

    private ArtworkFacade artworkFacade;
    private String formView;
    private String successView;

    public ArtworkFacade getArtworkFacade() {
        return artworkFacade;
    }

    public void setArtworkFacade(ArtworkFacade artworkFacade) {
        this.artworkFacade = artworkFacade;
    }

    public String getFormView() {
        return formView;
    }

    public void setFormView(String formView) {
        this.formView = formView;
    }

    public String getSuccessView() {
        return successView;
    }

    public void setSuccessView(String successView) {
        this.successView = successView;
    }

    /**
     * returns a tuple array comprised of previous and nextItem Id
     * 
     * @param artInCat
     * @param currentArt
     * @return previous and next array
     */
    public Long[] getNextAndPrevious(List<ArtEntity> artInCat, ArtEntity currentArt) {
        Long previous = -1L;
        Long next = -1L;
        if (artInCat.size() <= 0 || currentArt == null)
            return new Long[] { previous, next };

        for (int i = 0; i < artInCat.size(); i++) {
            if (artInCat.get(i).equals(currentArt)) {
                if (i > 0)
                    previous = artInCat.get(i - 1).getId();

                if (i < artInCat.size() - 1)
                    next = artInCat.get(i + 1).getId();

                break;
            }
        }
        return new Long[] { previous, next };
    }

    @SuppressWarnings("unchecked")
    protected Map getViewArtModelAndView(List<ArtEntity> artwork, ArtEntity selectedArt, Category cat) {
        Long[] nextAndPrevious = getNextAndPrevious(artwork, selectedArt);

        Boolean existsNext = false;
        Boolean existsPrevious = false;
        Long nextItemId = -1L;
        Long previousItemId = -1L;

        if (nextAndPrevious[0] > 0) {
            existsPrevious = true;
            previousItemId = nextAndPrevious[0];
        }

        if (nextAndPrevious[1] > 0) {
            existsNext = true;
            nextItemId = nextAndPrevious[1];
        }

        Map model = new HashMap();
        model.put("category", cat);
        model.put("artwork", artwork);
        model.put("selectedArt", selectedArt);
        model.put("existsNext", existsNext);
        model.put("existsPrevious", existsPrevious);
        model.put("nextItemId", nextItemId);
        model.put("previousItemId", previousItemId);
        return model;
    }

}
