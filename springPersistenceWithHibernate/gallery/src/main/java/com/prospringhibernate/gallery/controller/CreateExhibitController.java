package com.prospringhibernate.gallery.controller;

import java.util.Map;
import java.util.List;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.prospringhibernate.gallery.domain.Exhibition;
import com.prospringhibernate.gallery.service.ArtworkFacade;

public class CreateExhibitController extends AbstractController {

    private ArtworkFacade artworkFacade;
    private String formView;
    private String successView;
    public static String EXHIBIT_NAME_PARAM = "exhibitionName";
    protected static Log log = LogFactory.getLog(CreateExhibitController.class);

    @SuppressWarnings("unchecked")
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        String exhibit = httpServletRequest.getParameter(EXHIBIT_NAME_PARAM);

        if (exhibit != null && exhibit.length() > 0) {
            log.debug("Adding exhibit: " + exhibit);
            List<Exhibition> exhibitions = this.getArtworkFacade().getExhibitions();
            if (exhibitions != null) {
                for (Exhibition curExhibition : exhibitions) {
                    if (curExhibition.getExhibitionName().equalsIgnoreCase(exhibit)) {
                        log.error("can't create exhibit, the exhibit already exists!");
                        Map errorModel = new HashMap();
                        errorModel.put("error", "Exhibit with the name " + exhibit + " already exists!");
                        return new ModelAndView(this.getFormView(), errorModel);
                    }
                }
            }
            Exhibition exhibition = new Exhibition();
            exhibition.setExhibitionName(exhibit);
            this.getArtworkFacade().saveExhibition(exhibition);
            log.debug("Exhibit saved");
            Map model = new HashMap();
            model.put("exhibit", exhibition);
            return new ModelAndView(this.getSuccessView(), model);
        }

        return new ModelAndView(this.getFormView());
    }

    public String getSuccessView() {
        return successView;
    }

    public void setSuccessView(String successView) {
        this.successView = successView;
    }

    public String getFormView() {
        return formView;
    }

    public void setFormView(String formView) {
        this.formView = formView;
    }

    public ArtworkFacade getArtworkFacade() {
        return artworkFacade;
    }

    public void setArtworkFacade(ArtworkFacade artworkFacade) {
        this.artworkFacade = artworkFacade;
    }

}
