package com.prospringhibernate.gallery.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.ModelAndView;

import com.prospringhibernate.gallery.domain.ArtData;

public class DisplayImageController extends AbstractArtController {

    public static final String ARTDATA_ID = "ARTDATA_ID";

    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String artId = request.getParameter(ARTDATA_ID);
        if (artId == null)
            return null;
        Long artId_L = Long.parseLong(artId);
        ArtData artData = this.getArtworkFacade().getArtData(artId_L);
        if (artData != null) {
            FileCopyUtils.copy(artData.getPicture(), response.getOutputStream());
        }
        return null; // abort processing, since we took over the request
    }

}
